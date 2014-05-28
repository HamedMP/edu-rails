require 'spec_helper'

describe "categories/show", :type => :view do
  before(:each) do
    @category = assign(:category, create(:category, title: 'Title'))
    @related = assign(:related, create_list(:post, 2))
    @random_categories = assign(:random_categories, create_list(:category, 2))
    @posts = @category.posts.page(params[:page])
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
