ActiveAdmin.register Purchase do

  menu :priority => 4

  permit_params :user_id, :firstname, :lastname, :company, :ship_street_address, :ship_city, :ship_state, :ship_zipcode, :ship_country, :telephone,
                :email, :pay_firstname, :pay_lastname, :paycompany, :pay_telephone, :pay_street_address, :pay_city, :pay_state, :pay_zipcode,
                :pay_country, :pay_type, :pay_status, :subtotal, :shipping, :sales_tax, :total, :amount, :updated_at, :paycompany, :status, :state,
                :card_expires_on, :card_type, :ip_address, :question, lines_attributes: [ :id, :price, :quantity]


  member_action :send_shipped_email, :method => :post do
    @purchase = Purchase.find(params[:id])
    @current_user_id = @purchase.user_id
    @current_user = User.find(@current_user_id)
    PurchaseNotifier.shipped(@purchase, @current_user).deliver
    #update status to "Shipped"
    if (@purchase.status == "Shipped")
      redirect_to admin_purchase_path(@purchase), {:notice => "WARNING: EMAIL MESSAGE SENT TO CUSTOMER AGAIN - Your Purchase has Shipped Email was re-sent to #{@current_user.email}."}
    else
      @purchase.status = "Shipped"
      if @purchase.save
        redirect_to admin_purchase_path, {:notice => "Purchase ##{@purchase.id} Shipped Email has been sent to #{@current_user.email}."}
      else
        redirect_to admin_purchase_path(@purchase), {:notice => "Purchase Status could not be saved. Please review the status and try again."}
      end
    end
  end

  member_action :send_question_email, :method => :post do
    @purchase = Purchase.find(params[:id])
    @current_user_id = @purchase.user_id
    @current_user = User.find(@current_user_id)
    if PurchaseNotifier.question(@purchase, @current_user).deliver
      redirect_to admin_purchases_path, :notice => "Question or Comment Email message has been successfully sent to customer."
    else
      render :back, :notice => "ERROR: Could not deliver email message."
    end
  end

  index do
    column("Purchase ID#", :sortable => :id) {|purchase| link_to "##{purchase.id} ", admin_purchase_path(purchase) }
    column("Status") {|purchase| status_tag (purchase.current_status), (purchase.current_color) }
    column("First", :firstname, :sortable => :firstname)
    column("Last", :lastname, :sortable => :lastname)
    column("Date Created", :created_at)
    column("Amount", :total) do |amt|
      number_to_currency amt.total
    end
    actions
  end

  show do
    columns do
      column do
        panel "Purchase ##{purchase.id} Customer Information" do
          attributes_table_for purchase do
            row("Status") {|purchase| status_tag (purchase.status), (purchase.current_color) }
            row :email
            row :firstname
            row :lastname
            row :tax_id
            row :telephone
            row :contact_by
            row :ip_address
          end
        end
        panel "User Information - Purchase ##{purchase.id}" do
          attributes_table_for purchase.user do
            row("User ID#") { purchase.user_id }
            row("User Email") { purchase.user_email }
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
            row :shipping do |shipping| number_to_currency shipping.shipping end
            row :sales_tax do |st| number_to_currency st.sales_tax end
            row :total do |ttl| number_to_currency ttl.total end
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

    if (purchase.status == "Purchased")
      div :class => "recalculatebtn" do
        h3 { button_to "SHIP ORDER - Send Shipped EMail to Customer Now and Update Purchase Status to Shipped", "/admin/purchases/#{purchase.id}/send_shipped_email", :method => :post }
      end
    else
      div :class => "recalculatebtn" do
        if (purchase.status == "Shipped")
          h2 { "Warning: Shipped Email message already sent." }
         # h4 { button_to "Update Purchase Status to Shipped", "/admin/purchases/#{purchase.id}/set_to_shipped", :method => :post }
          h4 { button_to "RE-Send Shipped EMail to Customer Now and Re-Update Purchase Status to Shipped", "/admin/purchases/#{purchase.id}/send_shipped_email", :method => :post }
        else
          h2 { "Warning: Purchase ID# #{purchase.id} status is not set to Purchased or Shipped." }
          h2 { button_to "Warning: OVERRIDE Purchase ID# #{purchase.id}, set status to Shipped and send shipped email.",  "/admin/purchases/#{purchase.id}/send_shipped_email", :method => :post }
        end
      end
    end

    columns do
      column do
        active_admin_comments
      end
      column do
        panel "Questions for the Customer" do
          attributes_table_for purchase do
            row :question do |qq|
              best_in_place qq, :question, :type => :textarea, :display_with => :simple_format
            end
            h3 { button_to "Email Question Response History to Customer Now", "/admin/purchases/#{purchase.id}/send_question_email", :method => :post }
          end
        end
      end
    end
  end

  form do |f|
    f.actions
    f.inputs 'Purchase Status' do
      f.input :status, :as => :select, :collection => ['Submitted', 'Purchased', 'Shipped']
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
      f.input :ship_state, :as => :select, :collection => ::STATES
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
      f.input :pay_state, :as => :select, :collection => ::STATES, :label => 'State/Province'
      f.input :pay_zipcode
      f.input :pay_country, :as => :select, :collection => ::COUNTRIES
    end

    f.inputs 'Totals' do
      f.input :subtotal, :input_html => { disabled: true }
      f.input :sales_tax, :input_html => { disabled: true }
      f.input :shipping, :input_html => { disabled: true }
      f.input :total, :input_html => { disabled: true }
    end
    f.actions
  end
end
