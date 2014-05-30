require "spec_helper"

describe PostsController, :type => :routing do
  describe "routing" do

    it "routes to #show" do
      expect(get: "/1/2").to route_to("posts#show", category_id: '1', id: '2')
    end

    it "routes to #index" do
      expect(get: "/1").to route_to("posts#index", category_id: '1')
    end

  end

  describe 'root' do

    it "routes to #home" do
      expect(:get => "/").to route_to("posts#home")
    end

  end
end
