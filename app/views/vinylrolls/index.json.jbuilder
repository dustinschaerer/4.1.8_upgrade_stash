json.array!(@vinylrolls) do |vinylroll|
  json.extract! vinylroll, :quantity, :references, :references, :price
  json.url vinylroll_url(vinylroll, format: :json)
end