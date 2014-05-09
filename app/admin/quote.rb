ActiveAdmin.register Quote do
  menu :priority => 5
  actions :all, :except => [:destroy] 

  permit_params :user_id, :firstname, :lastname, :company, :ship_street_address, :ship_city, :ship_state, :ship_zipcode, :ship_country, :telephone, :email, :status, :shipping, :sales_tax, :subtotal, :total, :created_at, :updated_at, :question, 
   lines_attributes: [ :id, :price, :quantity]
  
  before_filter :recalculate_totals, only: [:show, :edit, :update, :destroy]
  after_filter :recalculate_totals, only: [:show, :edit, :update, :destroy]
  
  
  member_action :send_priced_email, :method => :post do
    # Do some work here...
    @quote = Quote.find(params[:id])
    @current_user_id = @quote.user_id
    @current_user = User.find(@current_user_id)
    QuoteNotifier.priced(@quote, @current_user).deliver
  
    #update status to "Priced"
    @quote.status = "Priced"
    if @quote.save!
      redirect_to admin_quotes_path, :notice => "Priced Email message sent to customer."    
    else
      render :back, :notice => "ERROR: Could not update Quote Status to Priced."
    end  
  end

  member_action :send_question_email, :method => :post do
    @quote = Quote.find(params[:id])
    @current_user_id = @quote.user_id
    @current_user = User.find(@current_user_id)
    if QuoteNotifier.question(@quote, @current_user).deliver
      redirect_to admin_quotes_path, :notice => "Question or Comment Email message has been successfully sent to customer."    
    else
      render :back, :notice => "ERROR: Could not deliver email message."
    end  
  end


  controller do
    
    def calculate_subtotal
      running_total = 0
      @quote.lines.each do |line|
        one_line_price = (line.quantity * line.price)
        running_total += one_line_price  
      end
      Quote.subtotal = running_total
    end

    def calculate_sales_tax
      if self.tax_id.blank?
        if (self.ship_state == 'Arkansas')
          tax_rate = 0.0975 
        elsif (self.ship_state == 'Minnesota')
          tax_rate = 0.06875 
        elsif (self.ship_state == 'New Jersey')
          tax_rate = 0.07 
        end
      else
        tax_rate = 0  
      end
      self.sales_tax = (self.subtotal * tax_rate).truncate(2)
    end

    def calculate_total
      self.total = (self.subtotal + self.shipping + self.sales_tax)
    end

    def recalculate_totals
      @quote = Quote.find(params[:id])
      @quote.calculate_subtotal
      @quote.calculate_sales_tax
      @quote.calculate_total
      @quote.save!
    end      

  end

  index do 
    column("Quote ID#", :sortable => :id) {|quote| link_to "##{quote.id} ", admin_quote_path(quote) }
    column("Quote Status") { |quote| status_tag(quote.status) }
    column("Customer", :user, :sortable => :user_id)
    column("City", :ship_city, :sortable => :city)
    column("State", :ship_state, :sortable => :state)
    column("Date Created", :created_at)
    column("Date Modified", :updated_at)
    
    column("Price Total", :total)  do |tl|
      number_to_currency tl.total
    end  
    default_actions
  end

  show do

    panel "Quote Details" do
      div do
       render "conditional_lines"
      end
      
    end

    div :class => "recalculatebtn" do
      h3 { link_to "Recalculate Totals and Pricing on this Quote Now", [:admin, quote] }
      h3 { button_to "Pricing Complete - Send EMail to Notify Customer Now", "/admin/quotes/#{quote.id}/send_priced_email", :method => :post }                                                                    
    end 

    columns do 
      column do
        panel "Quote ##{quote.id}  - Customer Information" do  
          attributes_table_for quote do
            row :status
          end  
          attributes_table_for quote.user do
            row("User") { auto_link quote.user }
            row :email
          end
          attributes_table_for quote do
            row :firstname
            row :lastname
            row :company
            row :tax_id do |tid|
              best_in_place tid, :tax_id, :type => :input
            end  
            row :telephone
            row :ship_street_address
            row :ship_city
            row :ship_state
            row :ship_zipcode
            row :ship_country 
            row :subtotal do |sb|
              number_to_currency sb.subtotal
            end  
            row :shipping do |i|
              best_in_place i, :shipping, :type => :input, :display_with => :number_to_currency
            end  
            row :sales_tax  do |st|
              best_in_place st, :sales_tax, :type => :input, :display_with => :number_to_currency
            end  
            row :total do |ttl|
              number_to_currency ttl.total
            end
            h3 { link_to "Recalculate Totals and Pricing on this Quote Now", [:admin, quote] }
          end 
        end  
      end # end column
      
      column do

        panel "Questions for the Customer" do
          attributes_table_for quote do
            row :question do |qq|
              best_in_place qq, :question, :type => :textarea, :display_with => :simple_format
            end
            h3 { button_to "Email Question Response History to Customer Now", "/admin/quotes/#{quote.id}/send_question_email", :method => :post }
          end
        end

        panel "Quote History" do
          attributes_table_for quote do
            row :created_at
            row :updated_at
          end
        end
        active_admin_comments
      end # end column
    end # end columns
  end # end show

  form do |f|
    f.actions
    f.inputs 'Details' do
      f.input :user_id, :input_html => { disabled: true }
      f.input :email, :input_html => { disabled: true }
      f.input :question
      f.input :firstname
      f.input :lastname
      f.input :company 
      f.input :telephone
      f.input :ship_street_address
      f.input :ship_city
      f.input :ship_state, :as => :select, :collection => Order::STATES
      f.input :ship_zipcode
      f.input :ship_country, :as => :string, :input_html => { :readonly => :true }
    end
    f.inputs 'Items in Quote' do
      f.has_many :lines, :allow_destroy => true,  :new_record => false do |linef|
        linef.input :quote_product_id, :label => 'Quote Product', :as => :select, :collection => QuoteProduct.all.order("id"), :input_html => { disabled: true }

        linef.input :length, :label => "Length (in Inches)", size: 5
        linef.input :width, :label => "Width (in Inches)", size: 5
        linef.input :height, :label => "Height (in Inches)", size: 5
        linef.input :cover_id, :label => 'Finish Cover', :as => :select, :collection => Cover.all.order("id"), :input_html => { disabled: true }
        linef.input :shape_id, :label => 'Shape', :as => :select, :collection => Shape.all.order("id"), :input_html => { disabled: true }
        linef.input :series_id, :label => 'Series', :as => :select, :collection => Series.all.order("id"), :input_html => { disabled: true }
        linef.input :color_id, :label => 'Color', :as => :select, :collection => Color.all.order("id"), :input_html => { disabled: true }
        linef.input :quantity
        linef.input :price do |p|
          number_to_currency p.price
        end   
      end  
    end

    f.inputs 'Totals' do  
      f.input :subtotal, :input_html => { disabled: true }
      f.input :sales_tax, :input_html => { disabled: true }
      f.input :shipping
      f.input :total, :input_html => { disabled: true }
      
    end
    
    f.actions
  end

####################################


  # sidebar "quote Details", only: [:show, :edit] do
  #   ul do
  #     li link_to("Line_Items", admin_order_line_items_path(order))
  #   end  
  # end


##################################



  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
