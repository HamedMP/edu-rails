require "rails_helper"

describe PostsController, :type => :routing do
  describe "routing" do

    it "routes to #show" do
      expect(get: "/category-slug/2014/may/01/post-slug")
        .to route_to("posts#show",
          category_id: 'category-slug',
          year: '2014',
          month: 'may',
          day: '01',
          id: 'post-slug'
        )
    end

    it "routes to #index" do
      expect(get: "/category-slug").to route_to("posts#index", category_id: 'category-slug')
    end

  end

  describe 'root' do

    it "routes to #home" do
      expect(:get => "/").to route_to("posts#home")
    end

  end
end
