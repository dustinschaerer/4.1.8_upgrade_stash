User.create!([
  {email: "dustinschaerer@gmail.com", password: "dustintest1", password_confirmation: "dustintest1", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 12, current_sign_in_at: "2014-01-15 21:27:27", last_sign_in_at: "2014-01-10 18:07:12", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", admin: nil, username: "Dustin Schaerer"},
  {email: "dustinamerica1@comcast.net", password: "dustintest2", password_confirmation: "dustintest2", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-01-06 21:57:12", last_sign_in_at: "2014-01-06 21:57:12", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", admin: nil, username: "dustin"}
])
AdminUser.create!([
  {email: "admin@example.com", encrypted_password: "$2a$10$T7ZiEa.xFVXGEYbLIp6AqeuG5LPPz2BTGNPouFGPJlGNFn2Sesno.", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2014-01-10 21:22:20", last_sign_in_at: "2014-01-01 22:44:51", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"}
])
Product.create!([
  {title: "Vinyl Table Covers", description: "<p>Vinyl Table Covers</p>", image_url: "vinyltablecover.jpg", thumbnail_url: "vinyltablecover-thumb.jpg", category_id: 1},
  {title: "Laminate Table Covers", description: "<p>Laminate Table Covers</p>", image_url: "laminatetablecover.jpg", thumbnail_url: "laminatetablecover-thumb.jpg", category_id: 1},
  {title: "Slip-Knot Padding", description: "<ul>\r\n\t<li>Stops the Slipping!</li>\r\n\t<li>The Best Non-Slip Product Available</li>\r\n\t<li>Cushions Elbows on the Table!</li>\r\n\t<li>Softens Room Noise</li>\r\n\t<li>Quiets Clearing Dishes</li>\r\n\t<li>Roll Length: 33 YDS</li>\r\n\t<li>Roll Widths: 36\" 48\" & 72\"</li>\r\n\t<li>Custom Cut Sizes Also Available to Your Specifications</li>\r\n\t<li>Flame Retardant: Meets or Exceeds</li>\r\n\t<li>Department of Commerce FF170 and FMVSS302</li>\r\n\t<li>We Recommend a 4\" Overhang on all Sides</li>\r\n\t<li>Cuts Easily with Scissors</li>\r\n</ul>", image_url: "slipknot-padding.jpg", thumbnail_url: "slipknot-padding-thumb.jpg", category_id: 2},
  {title: "White Vinyl Padding", description: "<ul>\r\n\t<li>Stops the Slipping!</li>\r\n\t<li>The Best Non-Slip Product Available</li>\r\n\t<li>Cushions Elbows on the Table!</li>\r\n\t<li>Softens Room Noise</li>\r\n\t<li>Quiets Clearing Dishes</li>\r\n\t<li>Roll Length: 33 YDS</li>\r\n\t<li>Roll Widths: 36\" 48\" & 72\"</li>\r\n\t<li>Custom Cut Sizes Also Available to Your Specifications</li>\r\n\t<li>Flame Retardant: Meets or Exceeds</li>\r\n\t<li>Department of Commerce FF170 and FMVSS302</li>\r\n\t<li>We Recommend a 4\" Overhang on all Sides</li>\r\n\t<li>Cuts Easily with Scissors</li>\r\n</ul>", image_url: "whitevinylpadding.jpg", thumbnail_url: "whitevinylpadding-thumb.jpg", category_id: 2},
  {title: "Rug-Stop Padding", description: "Rug-Stop Padding description text.", image_url: "slipknot-padding.jpg", thumbnail_url: "slipknot-padding-thumb.jpg", category_id: 2},
  {title: "Overlays", description: "Overlays description text.", image_url: "vinyltablecover.jpg", thumbnail_url: "vinyltablecover-thumb.jpg", category_id: 5},
  {title: "Placemats", description: "Placemats description text.", image_url: "vinyltablecover.jpg", thumbnail_url: "vinyltablecover.jpg", category_id: 5}
])
Color.create!([
  {series_id: 1, name: "Barley", image_url: "swatches/9800/9801/9801-Barley_med.jpg"},
  {series_id: 1, name: "Cabernet", image_url: "swatches/9800/9801/9801-Cabernet_med.jpg"},
  {series_id: 1, name: "Hunter Green", image_url: "swatches/9800/9801/9801-Hunter-Green_med.jpg"},
  {series_id: 1, name: "Lapis", image_url: "swatches/9800/9801/9801-Lapis_med.jpg"},
  {series_id: 1, name: "Port Wine", image_url: "swatches/9800/9801/9801-Port-Wine_med.jpg"},
  {series_id: 3, name: "White", image_url: "swatches/9800/9808/9808-White_med.jpg"},
  {series_id: 4, name: "Crimson", image_url: "swatches/6100/6101/6101-Crimson_med.jpg"},
  {series_id: 4, name: "Midnight", image_url: "swatches/6100/6101/6101-Midnight_med.jpg"},
  {series_id: 4, name: "Sandstone", image_url: "swatches/6100/6101/6101-Sandstone_med.jpg"},
  {series_id: 4, name: "Noir", image_url: "swatches/6100/6101/6101-Noir_med.jpg"},
  {series_id: 4, name: "Cypress", image_url: "swatches/6100/6101/6101-Cypress_med.jpg"},
  {series_id: 2, name: "Black & White", image_url: "swatches/9800/9801/9802-Black&White_med.jpg"},
  {series_id: 2, name: "Hunter Green", image_url: "swatches/9800/9801/9802-Hunter-Green_med.jpg"},
  {series_id: 2, name: "Cabernet", image_url: "swatches/9800/9801/9802-Cabernet_med.jpg"}
])
Order.create!([
  {firstname: "Greg", street_address: "123 Way street", city: "Vancouver", state: "Rhode Island", country: "United States", telephone: "555-555-5555", email: "abc@example.com", lastname: "Sample", user_id: 1, status: "submitted", company: "Toys", zipcode: "55555", contactby: "email"},
  {firstname: "Thomas Two", street_address: "222 two ave", city: "Twoville", state: "Texas", country: "United States", telephone: "555-555-5555", email: "dustinamerica1@comcast.net", lastname: "null", user_id: 1, status: "submitted", company: "null", zipcode: "null", contactby: "email"},
  {firstname: "Three T", street_address: "333 way street", city: "Threetown", state: "Washington", country: "United States", telephone: "555-555-5678", email: "dustinamerica1@comcast.net", lastname: "null", user_id: 1, status: "submitted", company: "null", zipcode: "null", contactby: "email"},
  {firstname: "Fighty Four", street_address: "444 Fourth Street", city: "Fourthtown", state: "Oregon", country: "United States", telephone: "555-555-5555", email: "dustinamerica1@comcast.net", lastname: "null", user_id: 1, status: "submitted", company: "null", zipcode: "null", contactby: "email"},
  {firstname: "Dustin", street_address: "333 Here Place", city: "Cityville", state: "Washington", country: "United States", telephone: "360944-5555", email: "dustinschaerer@gmail.com", lastname: "Schaerer", user_id: 1, status: "submitted", company: "Tomato Masters", zipcode: "98682", contactby: "email"},
  {firstname: "Dustin", street_address: "333 Here Place", city: "Cityville", state: "Washington", country: "United States", telephone: "360944-5555", email: "dustinschaerer@gmail.com", lastname: "Schaerer", user_id: 1, status: "submitted", company: "Tomato Masters", zipcode: "98682", contactby: "email"}
])
Series.create!([
  {style_id: 6, name: "9808 White Vinyl Padding", description: "White vinyl padding series description text.", image_url: "whitevinylpadding.jpg", lead: "", callout: ""},
  {style_id: 2, name: "6101", description: "Fruits, Veggies & Wines Make Create Their Own Environment. Great Design For Cafes, Seafood, or Fine Dining Rooms. ", image_url: "swatches/6100/6101/6101_hl.jpg", lead: "", callout: ""},
  {style_id: 1, name: "9801", description: "This understated, traditional pattern is a soothing alternative to bolder fabrics.", image_url: "swatches/9800/9801/9801_hl.jpg", lead: "Perfect Blend", callout: "soothing alternative"},
  {style_id: 1, name: "9802", description: "Cloverleaf checks never go out of style, setting a cheerful tone in casual eateries, both indoors and out.", image_url: "swatches/9800/9802/9802_hl.jpg", lead: "Timeless Touch", callout: "cheerful tone"},
  {style_id: 1, name: "9803", description: "Random streaks of color give this tasteful design a playful, contemporay vibe.", image_url: "swatches/9800/9803/9803_hl.jpg", lead: "lead", callout: "callout"},
  {style_id: 1, name: "9804", description: "A simple geometric motif....", image_url: "swatches/9800/9804/9804_hl.jpg", lead: "lead", callout: "callout"}
])
Style.create!([
  {title: "Classic Series 9800", name: "Classic Series 9800", description: "Table covers in Style 9800 Classic Vinyl are 10-mil PVC film.", image_url: "vinyltablecover.jpg", product_id: 8},
  {title: "Premium Series 6100", name: "Premium Series 6100", description: "Style 6100 Premium Vinyl table covers are 30% thicker for even better wear and comfort!", image_url: "vinyltablecover.jpg", product_id: 8},
  {title: "Laminated Vinyl Series 2000", name: "Laminated Vinyl Series 2000", description: "Laminated Vinyl Series 2000 description sample text.", image_url: "laminatetablecover.jpg", product_id: 9},
  {title: "Laminated Vinyl Series 1200", name: "Laminated Vinyl Series 1200", description: "Laminated Vinyl Series 1200 description sample text.", image_url: "laminatetablecover.jpg", product_id: 9},
  {title: "Slip-Knot Padding Sample", name: "Slip-Knot Padding Series", description: "Slip-Knot Padding Series description text.", image_url: "slipknot-padding.jpg", product_id: 10},
  {title: "White Vinyl Padding Sample Swatch", name: "White Vinyl Padding Series", description: "White Vinyl Padding Series description text.", image_url: "whitevinylpadding.jpg", product_id: 11}
])
Category.create!([
  {name: "Vinyl & Laminate Table Covers", description: "Vinyl & Laminate table cover description.", image_url: "laminatetablecover.jpg"},
  {name: "No-Slip Padding", description: "No-Slip Padding", image_url: "slipknot-padding.jpg"},
  {name: "Americlear Laminations", description: "Americlear Laminations description text.", image_url: "americlearmatte.jpg"},
  {name: "Upholstery", description: "Upholstery description text.", image_url: "upholstery.jpg"},
  {name: "Accessories", description: "Accessories description text.", image_url: "americlearmatte.jpg"}
])
Cart.create!([
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {}
])
LineItem.create!([
  {cart_id: 5, quantity: 1, order_id: nil, series_id: 1, color_id: 2},
  {cart_id: 5, quantity: 1, order_id: nil, series_id: 1, color_id: 2},
  {cart_id: 20, quantity: 1, order_id: nil, series_id: 1, color_id: 2},
  {cart_id: 15, quantity: 2, order_id: nil, series_id: 1, color_id: 3},
  {cart_id: 15, quantity: 1, order_id: nil, series_id: 1, color_id: 5},
  {cart_id: 15, quantity: 1, order_id: nil, series_id: 3, color_id: 6},
  {cart_id: 16, quantity: 1, order_id: nil, series_id: 1, color_id: 4},
  {cart_id: 16, quantity: 1, order_id: nil, series_id: 1, color_id: 3},
  {cart_id: 16, quantity: 1, order_id: nil, series_id: 1, color_id: 5},
  {cart_id: 16, quantity: 2, order_id: nil, series_id: 1, color_id: 1},
  {cart_id: nil, quantity: 1, order_id: 5, series_id: 1, color_id: 1},
  {cart_id: 28, quantity: 1, order_id: nil, series_id: 1, color_id: 1},
  {cart_id: 40, quantity: 1, order_id: nil, series_id: 1, color_id: 3},
  {cart_id: 41, quantity: 4, order_id: nil, series_id: 1, color_id: 1},
  {cart_id: 41, quantity: 1, order_id: nil, series_id: 1, color_id: 2},
  {cart_id: 41, quantity: 1, order_id: nil, series_id: 1, color_id: 4},
  {cart_id: 41, quantity: 1, order_id: nil, series_id: 1, color_id: 3},
  {cart_id: 43, quantity: 1, order_id: nil, series_id: 1, color_id: 4}
])
Subscriber.create!([
  {user_id_id: nil, email: "", active: nil},
  {user_id_id: nil, email: "drs@yo.com", active: nil},
  {user_id_id: nil, email: "dustinschaerer@gmail.com", active: nil},
  {user_id_id: nil, email: "dustinschaerer@tomsbarn.org", active: nil},
  {user_id_id: nil, email: "jenny@example.org", active: false}
])
