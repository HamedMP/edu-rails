require 'spec_helper'

describe "categories/index", :type => :view do
  before(:each) do
    assign(:categories, [
      Category.create!(
        :title => "Title",
        :slug => "Slug",
        :order => 1,
        :category => nil
      ),
      Category.create!(
        :title => "Title",
        :slug => "Slug",
        :order => 1,
        :category => nil
      )
    ])
  end

  it "renders a list of categories" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
