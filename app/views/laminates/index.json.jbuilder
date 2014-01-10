json.array!(@laminates) do |laminate|
  json.extract! laminate, :cover, :shape, :width, :length, :height, :drop, :series_id, :color_id, :umbrella, :velcro, :quantity, :price
  json.url laminate_url(laminate, format: :json)
end