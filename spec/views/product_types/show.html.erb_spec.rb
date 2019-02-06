require 'rails_helper'

RSpec.describe "product_types/show", type: :view do
  before(:each) do
    @product_type = assign(:product_type, ProductType.create!(
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
