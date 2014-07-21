ActiveAdmin.register Order do
  menu :priority => 6
  actions :all, :except => [:destroy] 

  permit_params :user_id, :firstname, :lastname, :company, :street_address, :city, :state, :zipcode, :country, :telephone, :email, :status, :question
  
  member_action :send_question_email, :method => :post do
    @order = Order.find(params[:id])
    @current_user_id = @order.user_id
    @current_user = User.find(@current_user_id)
    if OrderNotifier.question(@order, @current_user).deliver
      redirect_to admin_orders_path, :notice => "Question or Comment Email message has been successfully sent to customer."    
    else
      render :back, :notice => "ERROR: Could not deliver email message."
    end  
  end

  index do 
    column("Order ID#", :sortable => :id) {|order| link_to "##{order.id} ", admin_order_path(order) }
    column("Order Status") { |order| status_tag((order.status)) }
    column("Customer", :user, :sortable => :user_id)
    column("City", :city, :sortable => :city)
    column("State", :state, :sortable => :state)
    column("Date Created", :created_at)
    column("Date Modified", :updated_at)
    default_actions
  end
  

  show do

    columns do 
    
      column do

        panel "Order ##{order.id} Customer Information" do 
        
          attributes_table_for order.user do
            row("User") { auto_link order.user }
            row :email
          end
          attributes_table_for order do
            row :firstname
            row :lastname
            row :company
            row :street_address
            row :city
            row :state
            row :zipcode
            row :country
          end
        end  
        active_admin_comments
      end # end column
      
      column do

        panel "Invoice - Order ##{order.id}" do
          
          attributes_table_for order do
            row ("Order ID") { order.id }
            row :status
            row :created_at
            row :updated_at
          end
        
          table_for(order.line_items) do |t|
            t.column("Color") {|item| image_tag(item.color.image_url, :class => "invoicethumb img-responsive") }
            t.column("Swatch Style") {|item| auto_link item.series}
            t.column("Color") {|item| auto_link item.color}
          end
        end

        panel "Questions for the Customer" do
          attributes_table_for order do
            row :question do |qq|
              best_in_place qq, :question, :type => :textarea, :display_with => :simple_format
            end
            h3 { button_to "Email Question Response History to Customer Now", "/admin/orders/#{order.id}/send_question_email", :method => :post }
          end
        end

      end # end column
    end # end columns
  end # end show

  # sidebar "Order Details", only: [:show, :edit] do
  #   ul do
  #     li link_to("Line_Items", admin_order_line_items_path(order))
  #   end  
  # end
  
    form do |f|
      f.actions

      f.inputs 'Details' do
        f.input :status, :label => 'Order Status', :as => :select, :collection => [['Submitted', 'Submitted'], ['Shipped', 'Shipped']]
        f.input :user_id
        f.input :email
        f.input :firstname
        f.input :lastname
        f.input :company
        f.input :street_address
        f.input :city
        f.input :state
        f.input :zipcode
        f.input :country, :as => :string
      end
      f.inputs do
        f.has_many :line_items, :allow_destroy => true, :heading => 'Line Items', :new_record => false do |nf|
          nf.input :series_id
          nf.input :color_id
        end          
      end
      f.actions
    end
   
  
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
