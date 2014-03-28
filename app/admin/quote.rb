ActiveAdmin.register Quote do
  
  actions :all, :except => [:destroy] 

  permit_params :user_id, :firstname, :lastname, :company, :ship_street_address, :ship_city, :ship_state, :ship_zipcode, :ship_country, :telephone, :email, :status, :shipping, :sales_tax, :subtotal, :total, :created_at, :updated_at,
   lines_attributes: [ :id, :price]


  index do 
    column("Quote ID#", :sortable => :id) {|quote| link_to "##{quote.id} ", admin_quote_path(quote) }
    #column("Quote Status") { |quote| status_tag(quote.status) }
    column("Customer", :user, :sortable => :user_id)
    column("City", :ship_city, :sortable => :city)
    column("State", :ship_state, :sortable => :state)
    column("Date Created", :created_at)
    column("Date Modified", :updated_at)
    column("Quote Total", :total)
    default_actions
  end

  show do
    panel "Quote Details" do
      div do
       render "conditional_lines"
      end
      
    end

    columns do 
      column do
        panel "Quote ##{quote.id}  - Customer Information" do  
          attributes_table_for quote.user do
            row("User") { auto_link quote.user }
            row :email
          end
          attributes_table_for quote do
            row :firstname
            row :lastname
            row :company
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
              best_in_place i, :shipping, :type => :input
            end  
            row :sales_tax do |i|
              best_in_place i, :sales_tax, :type => :input, :display_with => :number_to_currency
            end  
            row :total do |ttl|
              number_to_currency ttl.total
            end
            strong { link_to "Update Totals and Pricing on this Quote", [:admin, quote] }
          end 
        end  
      end # end column
      
      column do
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
      f.input :status, :label => 'Quote Status', :as => :select, :collection => [['Submitted', 'Submitted'], ['Shipped', 'Shipped']]
      f.input :user_id
      f.input :email
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
