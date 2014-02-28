json.array!(@upholsteryrolls) do |upholsteryroll|
  json.extract! upholsteryroll, :quantity, :series_id, :color_id, :price
  json.url upholsteryroll_url(upholsteryroll, format: :json)
end