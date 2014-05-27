require 'spec_helper'

describe "categories/show", :type => :view do
  before(:each) do
    @category = assign(:category, Category.create!(
      :title => "Title",
      :slug => "Slug",
      :order => 1,
      :category => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
  end
end
