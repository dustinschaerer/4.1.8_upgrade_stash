json.array!(@subscribers) do |subscriber|
  json.extract! subscriber, :user_id_id, :email, :active
  json.url subscriber_url(subscriber, format: :json)
end