json.array!(@shapes) do |shape|
  json.extract! shape, :name
  json.url shape_url(shape, format: :json)
end