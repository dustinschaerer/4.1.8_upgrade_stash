json.array!(@frogs) do |frog|
  json.extract! frog, :name, :size
  json.url frog_url(frog, format: :json)
end