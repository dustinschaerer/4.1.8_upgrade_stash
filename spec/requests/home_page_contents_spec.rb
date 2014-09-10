require 'spec_helper'

describe "HomePageContents" do
  describe "GET /home_page_contents" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get home_page_contents_path
      response.status.should be(200)
    end
  end
end
