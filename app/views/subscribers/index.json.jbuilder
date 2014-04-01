json.array!(@subscribers) do |subscriber|
  json.extract! subscriber, :email, :active
  json.url subscriber_url(subscriber, format: :json)
end