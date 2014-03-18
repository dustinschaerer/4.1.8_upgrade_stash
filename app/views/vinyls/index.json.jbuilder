json.array!(@vinyls) do |vinyl|
  json.extract! vinyl, :cover_id, :shape_id, :width, :length, :height, :drop, :series_id, :color_id, :umbrella, :velcro, :quantity, :price
  json.url vinyl_url(vinyl, format: :json)
end