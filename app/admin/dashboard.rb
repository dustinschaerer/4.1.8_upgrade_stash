ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    
    columns do 
    
      column do
        panel "Recent Purchases" do
          table_for Purchase.order('id desc').limit(15).each do |purchase|      
            #column("purchase ID#") {|purchase| link_to(purchase.id, admin_purchase_path(purchase.id))}
            #column("Status") {|order| status_tag (order.is_complete? ? "Shipped" : "Submitted"), (order.is_complete? ? :ok : :error) }
            #column("Status") {|purchase| status_tag (purchase.is_complete? ? "Purchased" : "Shipped"), (purchase.is_complete? ? :ok : :error)   }
            column("Status") {|purchase| status_tag (purchase.current_status), (purchase.current_color) }
            #column("Status") {|purchase| (purchase.status)  }
            #column("Price Total") {|purchase| (number_to_currency(purchase.total)) }
            column "Price Total", :total do |purchase| 
              div :class => "total-price" do
                number_to_currency(purchase.total)
              end
            end  
           # column("Customer"){|purchase| link_to(purchase.user.email, admin_purchase_path(purchase.user)) }
            column("First Name"){|purchase| (purchase.firstname) }
            column("Last Name"){|purchase| (purchase.lastname) }
            column("View ") {|purchase| link_to("View", admin_purchase_path(purchase.id))}
            column("Edit") {|purchase| link_to(purchase.id, edit_admin_purchase_path(purchase.id))}
          end
        end


        panel "Recent Quote Requests" do
          table_for Quote.order('id desc').limit(15).each do |quote|      
            column("Quote ID#") {|quote| link_to(quote.id, admin_quote_path(quote.id))}
          # column("Status") {|quote| (quote.status)  }
          # column("Status") {|quote| status_tag (quote.is_complete? ? "Priced" : "Submitted"), (quote.is_complete? ? :ok : :error) }
            column("Status") {|quote| status_tag (quote.status), (quote.current_color) }
            column("Price Total") {|quote| number_to_currency((quote.total)) }
          # column("Customer"){|quote| link_to(quote.user.email, admin_quote_path(quote.user)) }
            column("First Name"){|quote| (quote.firstname) }
            column("Last Name"){|quote| (quote.lastname) }
            column("View ") {|quote| link_to("View", admin_quote_path(quote.id))}
            column("Edit") {|quote| link_to(quote.id, edit_admin_quote_path(quote.id))}
          end
        end
      end

      column do
        panel "Recent Swatch & Catalog Orders" do
          table_for Order.order('id desc').limit(15) do
            column("Order ID#") {|order| link_to(order.id, admin_order_path(order.id))}
            column("Status") {|order| status_tag (order.status), (order.current_color) }

            #column("Status") {|order| status_tag (order.is_complete? ? "Shipped" : "Submitted"), (order.is_complete? ? :ok : :error) }
           # column("Customer"){|order| link_to(order.user.email, admin_order_path(order.user)) }
            column("First Name"){|order| (order.firstname) }
            column("Last Name"){|order| (order.lastname) }
            column("View ") {|order| link_to("View", admin_order_path(order.id))}
            column("Edit") {|order| link_to(order.id, edit_admin_order_path(order.id))}
          end
        end
      end


    end # columns

    #############################################
    ######Bring this back for Users
    # columns do

    #   column do
  
    #     panel "Recent Users to Sign Up" do
    #       table_for User.order('id desc').limit(20).each do |user|
    #         column(:email) {|user| link_to(user.email, admin_user_path(user)) }
    #         column(:username)
    #       end
    #     end
    #   end
    #
    # end # columns
    #############################################

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end