require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  fixtures :products

  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:category_id].any?
    assert product.errors[:image_url].any?
    assert product.errors[:thumbnail_url].any?
  end

#  test "image url is valid with correct URL" do
#    product = Product.new(title:       "Vinyl Swatch Sample",
#                          description: "8 x 10 Vinyl Swatch Sample",
#                          category:    "Vinyl",
#                          image_url:   "fred.gif",
#                          thumbnail_url: "fred-thumb.gif" )
#
#   assert product.valid?, "fred.gif should be valid"
#  end     

  test "image url is invalid with incorrectly formatter URL" do
    product = Product.new(title:       "Vinyl Swatch Sample",
                          description: "8 x 10 Vinyl Swatch Sample",
                          category_id:    "1",
                          image_url:   "fred.g",
                          thumbnail_url: "fred-thumb.gif" )

    assert product.invalid?, "fred.g shouldn't be valid"
  end     



  test "product is not valid without a unique title" do
    product = Product.new(title:       products(:vinyl).title,
                          description: "8 x 10 Vinyl Swatch Sample", 
                          category_id:    "1", 
                          image_url:   "fred.gif",
                          thumbnail_url: "fred-thumb.gif" )

    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end

  test "product is not valid without a unique title - i18n" do
    product = Product.new(title:       products(:vinyl).title,
                          description: "yyy", 
                          category_id:    "1",
                          image_url:   "fred.gif",
                          thumbnail_url: "fred-thumb.gif")

    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')],
                 product.errors[:title]
  end
  
end