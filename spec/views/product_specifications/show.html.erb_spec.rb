require 'rails_helper'

RSpec.describe "product_specifications/show", type: :view do
  before(:each) do
    @product_specification = assign(:product_specification, ProductSpecification.create!(
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
