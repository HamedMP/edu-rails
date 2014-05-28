require 'spec_helper'

describe "posts/show", :type => :view do
  before(:each) do
    @post = assign(:post, create(:post))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
