json.array!(@items) do |item|
  json.extract! item, :quotecart_id, :itemable_id, :itemable_type
  json.url item_url(item, format: :json)
end