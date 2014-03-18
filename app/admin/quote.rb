ActiveAdmin.register Quote do
  
  actions :all, :except => [:destroy] 

  permit_params :user_id, :firstname, :lastname, :company, :ship_street_address, :ship_city, :ship_state, :ship_zipcode, :ship_country, :telephone, :email, :status, :shipping, :sales_tax, :subtotal, :total, :created_at, :updated_at
  
  index do 
    column("Quote ID#", :sortable => :id) {|quote| link_to "##{quote.id} ", admin_quote_path(quote) }
    column("Quote Status") { |quote| status_tag(quote.status) }
    column("Customer", :user, :sortable => :user_id)
    column("City", :ship_city, :sortable => :city)
    column("State", :ship_state, :sortable => :state)
    column("Date Created", :created_at)
    column("Date Modified", :updated_at)
    default_actions
  end
  

  show do

    columns do 
    
      column do

        panel "Customer Information" do 
        
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
          end   
        end  
        active_admin_comments
      end # end column
      
      column do

        panel "Quote Details" do
          
          attributes_table_for quote do
            row ("Quote ID#") { quote.id }
            row :status
            row :created_at
            row :updated_at
          end
        
          table_for(quote.items) do |t|
            t.column("Quote Product Type") {|item| item.itemable_type }
            t.column("Quote Product Type") {|item| item.itemable_id }     
          end

          table_for(quote.items) do |t|
            t.column("ADD PRICING TO Quote ITEMS") {|item| link_to "##{item.itemable_type} - #{item.itemable_id} ", "/admin/#{item.itemable_type}s/#{item.itemable_id}/edit" }
          end

          table_for(quote.items) do |item|

          # lookup = item.itemable_type.capitalize
           # @lookup = lookup.find(item.itemable_id)

            #item.column("LINE ITEM DETAILS") {|item| @lookup.price }
            item.column("LINE ITEM DETAILS") {|item| link_to "##{item.itemable_type} - #{item.itemable_id} ", "/admin/#{item.itemable_type}s/#{item.itemable_id}/edit" }
          end

        end

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
      f.input :ship_street_address
      f.input :ship_city
      f.input :ship_state
      f.input :ship_zipcode
      f.input :ship_country, :as => :string
      f.input :subtotal
      f.input :sales_tax
      f.input :shipping
      f.input :total
      f.input :pay_type
    end
    f.inputs 'Items' do
      f.has_many :items, :allow_destroy => true,  :new_record => false do |itemf|
        itemf.input :itemable_type
        itemf.input :itemable_id

      end  
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
