json.array!(@sizes) do |size|
  json.extract! size, :dimension, :minimum
  json.url size_url(size, format: :json)
end