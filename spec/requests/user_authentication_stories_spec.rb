require 'spec_helper'

describe "UserAuthenticationStories" do
  describe "GET /user_authentication_stories" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get user_authentication_stories_index_path
      response.status.should be(200)
    end
  end
end
