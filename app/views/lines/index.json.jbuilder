json.array!(@lines) do |line|
  json.extract! line, :quote_product_id, :length, :width, :height, :cover_id, :series_id, :color_id, :shape_id, :umbrella, :velcro, :yards, :size_id, :quantity, :price
  json.url line_url(line, format: :json)
end