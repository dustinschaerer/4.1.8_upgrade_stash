ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Purchases" do
          table_for Purchase.order('id desc').limit(15).each do |purchase|
            column("Status") {|purchase| status_tag (purchase.current_status), (purchase.current_color) }
            column "Price Total", :total do |purchase|
              div :class => "total-price" do
                number_to_currency(purchase.total)
              end
            end
            column("First Name"){|purchase| (purchase.firstname) }
            column("Last Name"){|purchase| (purchase.lastname) }
            column("View ") {|purchase| link_to("View", admin_purchase_path(purchase.id))}
            column("Edit") {|purchase| link_to(purchase.id, edit_admin_purchase_path(purchase.id))}
          end
        end
        panel "Recent Quote Requests" do
          table_for Quote.order('id desc').limit(15).each do |quote|
            column("Quote ID#") {|quote| link_to(quote.id, admin_quote_path(quote.id))}
            column("Status") {|quote| status_tag (quote.status), (quote.current_color) }
            column("Price Total") {|quote| number_to_currency((quote.total)) }
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
            column("First Name"){|order| (order.firstname) }
            column("Last Name"){|order| (order.lastname) }
            column("View ") {|order| link_to("View", admin_order_path(order.id))}
            column("Edit") {|order| link_to(order.id, edit_admin_order_path(order.id))}
          end
        end
      end
    end
  end
end