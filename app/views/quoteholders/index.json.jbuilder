json.array!(@quoteholders) do |quoteholder|
  json.extract! quoteholder, 
  json.url quoteholder_url(quoteholder, format: :json)
end