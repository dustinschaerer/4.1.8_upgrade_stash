json.array!(@vinyls) do |vinyl|
  json.extract! vinyl, :cover, :shape, :width, :length, :height, :drop, :series_id, :color_id, :umbrella, :velcro, :quantity, :price
  json.url vinyl_url(vinyl, format: :json)
end