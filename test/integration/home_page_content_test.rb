require 'test_helper'

class HomePageContentTest < ActionDispatch::IntegrationTest

  test "home page should show collections" do 
    visit root_url
    
    assert has_content? 'VALUE COLLECTION', "Does not display VALUE COLLECTION"
    assert has_content? 'CLASSIC COLLECTION', "Does not display CLASSIC COLLECTION"
    assert has_content? 'PREMIUM COLLECTION', "Does not display PREMIUM COLLECTION"
    assert has_content? 'DESIGNER COLLECTION', "Does not display DESIGNER COLLECTION"


  end
end