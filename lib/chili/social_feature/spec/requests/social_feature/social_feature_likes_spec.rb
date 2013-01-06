require 'spec_helper'

describe "Likes" do
  describe "GET /social_feature_likes" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get social_feature_likes_path
      response.status.should be(200)
    end
  end
end
