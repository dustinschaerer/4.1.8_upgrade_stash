ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    
    columns do
    
      column do
        panel "Recent Swatch & Catalog Orders" do
          table_for Order.order('id desc').limit(20) do
            column("Order ID#") {|order| link_to(order.id, admin_order_path(order.id))}
            column("Status") {|order| status_tag(order.status) }
            column("Customer"){|order| link_to(order.user.email, admin_order_path(order.user)) }
            column("First Name"){|order| (order.firstname) }
            column("Last Name"){|order| (order.lastname) }
            column("Company"){|order| (order.company) }
            column("View ") {|order| link_to("View", admin_order_path(order.id))}
            column("Edit") {|order| link_to(order.id, edit_admin_order_path(order.id))}

          end
        end
      end

      column do
        panel "Recent Quote Requests" do
          table_for Quote.order('id desc').limit(20).each do |quote|      
            column("Quote ID#") {|quote| link_to(quote.id, admin_quote_path(quote.id))}
            column("Status") {|quote| status_tag(quote.status) }
            column("Customer"){|quote| link_to(quote.user.email, admin_quote_path(quote.user)) }
            column("First Name"){|quote| (quote.firstname) }
            column("Last Name"){|quote| (quote.lastname) }
            column("Company"){|quote| (quote.company) }
            column("View ") {|quote| link_to("View", admin_quote_path(quote.id))}
            column("Edit") {|quote| link_to(quote.id, edit_admin_quote_path(quote.id))}

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