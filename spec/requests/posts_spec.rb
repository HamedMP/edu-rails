require 'spec_helper'

describe "Posts", :type => :request do
  describe "GET /posts" do
    before(:each) do
      create_list(:post, 9)
      create_list(:post, 4, is_featured: true)
      create_list(:post, 9, is_vacancy: true)
    end

    it "works! (now write some real specs)" do
      get root_path
      expect(response.status).to be(200)
    end
  end
end
