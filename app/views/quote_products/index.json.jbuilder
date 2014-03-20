json.array!(@quote_products) do |quote_product|
  json.extract! quote_product, :name, :group
  json.url quote_product_url(quote_product, format: :json)
end