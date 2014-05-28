require 'spec_helper'

describe "categories/index", :type => :view do
  before(:each) do
    assign(:categories, create_list(:category, 2))
  end

  it "renders a list of categories" do
    render
    assert_select "table.categories > tbody > tr", count: 2
  end
end
