json.array!(@upholsterycuts) do |upholsterycut|
  json.extract! upholsterycut, :quantity, :series_id, :color_id, :price, :yards_long
  json.url upholsterycut_url(upholsterycut, format: :json)
end