require 'rails_helper'

RSpec.describe Client, type: :model do
  	it 'Client is valid?' do
		client = create(:client)
	  	expect(client).to be_valid
	end
end
