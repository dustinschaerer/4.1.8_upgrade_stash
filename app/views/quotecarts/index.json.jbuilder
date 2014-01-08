json.array!(@quotecarts) do |quotecart|
  json.extract! quotecart, 
  json.url quotecart_url(quotecart, format: :json)
end