require 'rails_helper'

RSpec.describe "client_types/show", type: :view do
  before(:each) do
    @client_type = assign(:client_type, ClientType.create!(
      :name => "Name",
      :tax_discount => 2.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2.5/)
  end
end
