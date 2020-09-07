# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'payment_types/edit', type: :view do
  before(:each) do
    @payment_type = assign(:payment_type, PaymentType.create!(
                                            name: 'MyString',
                                            description: 'MyText'
                                          ))
  end

  it 'renders the edit payment_type form' do
    render

    assert_select 'form[action=?][method=?]', payment_type_path(@payment_type), 'post' do
      assert_select 'input[name=?]', 'payment_type[name]'

      assert_select 'textarea[name=?]', 'payment_type[description]'
    end
  end
end
