require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :value => 2.5,
        :cost_price => 3.5,
        :tax => 4.5,
        :sale_price => 5.5,
        :name => "Name"
      ),
      Product.create!(
        :value => 2.5,
        :cost_price => 3.5,
        :tax => 4.5,
        :sale_price => 5.5,
        :name => "Name"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
    assert_select "tr>td", :text => 5.5.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
