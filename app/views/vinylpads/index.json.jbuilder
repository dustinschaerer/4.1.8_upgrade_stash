json.array!(@vinylpads) do |vinylpad|
  json.extract! vinylpad, :quantity, :price
  json.url vinylpad_url(vinylpad, format: :json)
end