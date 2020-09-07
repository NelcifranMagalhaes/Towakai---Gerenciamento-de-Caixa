# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'product_specifications/index', type: :view do
  before(:each) do
    assign(:product_specifications, [
             ProductSpecification.create!(
               name: 'Name',
               description: 'MyText'
             ),
             ProductSpecification.create!(
               name: 'Name',
               description: 'MyText'
             )
           ])
  end

  it 'renders a list of product_specifications' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
  end
end
