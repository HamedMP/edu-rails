require "rails_helper"

describe API::V1::PostsController, :type => :routing do
  describe "routing" do

    it "routes to #show" do
      expect(get: "/api/v1/posts/1").to route_to("api/v1/posts#show", id: '1', format: :json)
    end

    it "routes to #index" do
      expect(get: "/api/v1/posts/").to route_to("api/v1/posts#index", format: :json)
    end

  end
end
