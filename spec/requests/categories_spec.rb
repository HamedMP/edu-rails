require 'spec_helper'

describe "Categories", :type => :request do
  describe "GET /categories/:id" do
    it "works! (now write some real specs)" do
      category = create :category
      get category_path(category)
      expect(response.status).to be(200)
    end
  end
end
