json.array!(@americlears) do |americlear|
  json.extract! americlear, :quantity, :yards, :wide, :price
  json.url americlear_url(americlear, format: :json)
end