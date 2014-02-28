json.array!(@laminatecuts) do |laminatecut|
  json.extract! laminatecut, :quantity, :yards_long, :series_id, :color_id, :price
  json.url laminatecut_url(laminatecut, format: :json)
end