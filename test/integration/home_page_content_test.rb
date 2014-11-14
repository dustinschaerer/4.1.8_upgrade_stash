require 'test_helper'

class HomePageContentTest < ActionDispatch::IntegrationTest

  test "home page should show collections" do 
    visit root_url
    assert has_content?('VALUE Collection'), "Does not display VALUE Collection"
    assert has_content?('CLASSIC Collection'), "Does not display CLASSIC Collection"
    assert has_content?('PREMIUM Collection'), "Does not display PREMIUM Collection"
    assert has_content?('DESIGNER Collection'), "Does not display DESIGNER Collection"
  end
  
end