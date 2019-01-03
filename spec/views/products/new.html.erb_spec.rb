require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      :value => 1.5,
      :cost_price => 1.5,
      :tax => 1.5,
      :sale_price => 1.5,
      :name => "MyString"
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[value]"

      assert_select "input[name=?]", "product[cost_price]"

      assert_select "input[name=?]", "product[tax]"

      assert_select "input[name=?]", "product[sale_price]"

      assert_select "input[name=?]", "product[name]"
    end
  end
end
