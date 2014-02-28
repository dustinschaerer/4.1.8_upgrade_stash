json.array!(@nonslippads) do |nonslippad|
  json.extract! nonslippad, :quantity, :width, :price
  json.url nonslippad_url(nonslippad, format: :json)
end