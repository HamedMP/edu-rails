require "spec_helper"

describe PostsController, :type => :routing do
  describe "routing" do

    it "routes to #show" do
      expect(:get => "/posts/1").to route_to("posts#show", :id => "1")
    end

  end

  describe 'root' do

    it "routes to #home" do
      expect(:get => "/").to route_to("posts#home")
    end

  end
end
