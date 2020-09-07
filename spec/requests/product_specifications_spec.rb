# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ProductSpecifications', type: :request do
  describe 'GET /product_specifications' do
    it 'works! (now write some real specs)' do
      get product_specifications_path
      expect(response).to have_http_status(200)
    end
  end
end
