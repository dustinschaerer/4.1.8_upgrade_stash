json.array!(@nonslipcuts) do |nonslipcut|
  json.extract! nonslipcut, :quantity, :inches_wide, :inches_long, :price
  json.url nonslipcut_url(nonslipcut, format: :json)
end