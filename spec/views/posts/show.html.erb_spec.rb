require 'spec_helper'

describe "posts/show", :type => :view do
  before(:each) do
    @post = assign(:post, create(:post, title: 'Title', body: 'MyText'))
    @related = assign(:related, create_list(:post, 4))
    @random_categories = assign(:random_categories, create_list(:category, 5))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
