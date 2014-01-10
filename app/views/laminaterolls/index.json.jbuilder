json.array!(@laminaterolls) do |laminateroll|
  json.extract! laminateroll, :quantity, :series_id, :color_id, :price
  json.url laminateroll_url(laminateroll, format: :json)
end