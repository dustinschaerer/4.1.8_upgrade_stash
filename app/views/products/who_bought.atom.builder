atom_feed do |feed|
  feed.title "Who bought #{@product.title}"
  feed.updated @latest_order.try(:updated_at)
  @product.orders.each do |order|
    feed.entry(order) do |entry|
      entry.title "Order #{order.id}"
      entry.summary type: 'xhtml' do |xhtml|
        xhtml.p "Shipped to #{order.ship_street_address}"
        xhtml.br "#{order.ship_city}, #{order.ship_state} #{order.ship_country}"
        xhtml.table do
          xhtml.tr do
            xhtml.th 'Product'
            xhtml.th 'Quantity'
            xhtml.th 'Category'
          end
          order.line_items.each do |item|
            xhtml.tr do
              xhtml.td item.product.title
              xhtml.td item.quantity
              xhtml.td item.product.category_id
            end
          end
        end
      end
      entry.author do |author|
        author.name order.name
        author.email order.email
      end
    end
  end
end