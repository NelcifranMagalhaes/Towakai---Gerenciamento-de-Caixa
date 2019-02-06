require 'rails_helper'

RSpec.describe "product_types/index", type: :view do
  before(:each) do
    assign(:product_types, [
      ProductType.create!(
        :name => "Name",
        :description => "MyText"
      ),
      ProductType.create!(
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of product_types" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
