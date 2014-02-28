json.array!(@vinylcuts) do |vinylcut|
  json.extract! vinylcut, :quantity, :yards_long, :series_id, :color_id, :price
  json.url vinylcut_url(vinylcut, format: :json)
end