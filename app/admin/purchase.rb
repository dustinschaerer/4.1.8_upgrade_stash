ActiveAdmin.register Purchase do

  menu :priority => 4

  permit_params :user_id, :firstname, :lastname, :company, :ship_street_address, :ship_city, :ship_state, :ship_zipcode, :ship_country, :telephone, 
                :email, :pay_firstname, :pay_lastname, :paycompany, :pay_telephone, :pay_street_address, :pay_city, :pay_state, :pay_zipcode, 
                :pay_country, :pay_type, :pay_status, :subtotal, :shipping, :sales_tax, :total, :amount, :updated_at, :paycompany, :status, :state, 
                :card_expires_on, :card_type, :ip_address, lines_attributes: [ :id, :price, :quantity]
  

  member_action :send_shipped_email, :method => :post do
    # Do some work here...
    @purchase = Purchase.find(params[:id])
    @current_user_id = @purchase.user_id
    @current_user = User.find(@current_user_id)
    PurchaseNotifier.shipped(@purchase, @current_user).deliver
    
    #update status to "Priced"
    if (@purchase.status == "Shipped")
      redirect_to admin_purchase_path(@purchase), {:notice => "WARNING: ALREADY SENT - Your Purchase has Shipped Email has already been sent to #{@current_user.email}."}    
    else
      @purchase.status = "Shipped"
      if @purchase.save!
        redirect_to admin_purchase_path, {:notice => "Purchase ##{@purchase.id} Shipped Email has been sent to #{@current_user.email}."}    
      else
        redirect_to admin_purchase_path(@purchase), {:notice => "Purchase Status could not be saved. Please review the status and try again."}
      end
    end
  end


  index do 


    column("Purchase ID#", :sortable => :id) {|purchase| link_to "##{purchase.id} ", admin_purchase_path(purchase) }
    column("Purchase Status") { |purchase| status_tag((purchase.is_complete? ? "Shipped" : "Submitted"), (purchase.is_complete? ? :ok : :error)) }     
    column("State", :state, :sortable => :state)
    column("First", :firstname, :sortable => :firstname)
    column("Last", :lastname, :sortable => :lastname)
    column("Date Created", :created_at)
    column("Amount", :total) do |amt|
      number_to_currency amt.total
    end  
    default_actions
  end
  
  show do
    columns do 
      column do
        panel "Purchase ##{purchase.id} Customer Information" do   
          attributes_table_for purchase do
            row :status
            row :email
            row :firstname
            row :lastname
            row :telephone
            row :contact_by
            row :ip_address
          end
        end
        panel "User Information - Purchase ##{purchase.id}" do 
          attributes_table_for purchase.user do
            row("User ID#") { purchase.user_id }
            row("User Email") { purchase.user.email }
          end
        end 
      end
      column do
        panel "Shipping Information" do 
          attributes_table_for purchase do
            row :firstname
            row :lastname
            row :company
            row :ship_street_address
            row :ship_city
            row :ship_state
            row :ship_zipcode
            row :ship_country
          end
        end
      end

      column do
        panel "Purchase Totals" do       
          attributes_table_for purchase do
            row :subtotal do |sb| number_to_currency sb.subtotal end 
            row :shipping do |shipping| number_to_currency shipping.subtotal end
            row :sales_tax do |st| number_to_currency st.sales_tax end
            row :total do |ttl| number_to_currency ttl.total end
            row :amount
            row :state
            row :pay_city
            row :pay_state
            row :pay_zipcode
            row :pay_country
          end         
        end  
      end

      column do
        panel "Payment Information" do       
          attributes_table_for purchase do
            row :pay_firstname
            row :pay_lastname
            row :pay_company
            row :pay_telephone
            row :pay_contact_by
            row :pay_street_address
            row :pay_city
            row :pay_state
            row :pay_zipcode
            row :pay_country
            row :card_type
            row :card_expires_on
          end         
        end  
      end # end column
    end  # end columns

    panel "Purchase ##{purchase.id} Details" do
      div do
       render "conditional_purchase_lines"
      end
      
    end
    div :class => "recalculatebtn" do
      h3 { button_to "Order Has Shipped - Send Shipped EMail to Customer Now and Update Purchase Status", "/admin/purchases/#{purchase.id}/send_shipped_email", :method => :post }                                                                    
    end 


    active_admin_comments
  end
  






  form do |f|
    f.actions
    f.inputs 'Purchase Status' do
      f.input :status, :as => :select, :collection => ['Submitted', 'Shipped']
    end

    f.inputs 'Customer Details' do
      f.input :user_id, :input_html => { disabled: true }
      f.input :email, :input_html => { disabled: true }
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

     f.inputs 'Payment Details' do
      f.input :pay_firstname
      f.input :pay_lastname
      f.input :pay_company 
      f.input :pay_telephone
      f.input :pay_street_address
      f.input :pay_city
      f.input :pay_state, :as => :select, :collection => Order::STATES
      f.input :pay_zipcode
      f.input :pay_country, :as => :string, :input_html => { :readonly => :true }
    end

   # f.inputs 'Items in Purchase' do
   #   f.has_many :lines, :allow_destroy => true, :new_record => false do |linef|
   #     linef.input :quote_product_id, :label => 'Product', :as => :select, :collection => QuoteProduct.all.order("id"), :input_html => { disabled: true }#
#
#        linef.input :width, :label => "Width (in Inches)", size: 5
#        linef.input :height, :label => "Height (in Inches)", size: 5
#        linef.input :cover_id, :label => 'Finish Cover', :as => :select, :collection => Cover.all.order("id"), :input_html => { disabled: true }
#        linef.input :shape_id, :label => 'Shape', :as => :select, :collection => Shape.all.order("id"), :input_html => { disabled: true }
#        linef.input :series_id, :label => 'Series', :as => :select, :collection => Series.all.order("id"), :input_html => { disabled: true }
#        linef.input :color_id, :label => 'Color', :as => :select, :collection => Color.all.order("id"), :input_html => { disabled: true }
#        linef.input :quantity, :input_html => { disabled: true } do |p|
#        linef.input :price, :input_html => { disabled: true } do |p|
#          number_to_currency p.price        end   
#      end  
#    end

    f.inputs 'Totals' do  
      f.input :subtotal, :input_html => { disabled: true }
      f.input :sales_tax, :input_html => { disabled: true }
      f.input :shipping, :input_html => { disabled: true }
      f.input :total, :input_html => { disabled: true }
      
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
