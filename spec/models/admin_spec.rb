require 'rails_helper'

RSpec.describe Admin, type: :model do
  context 'validations' do
    it do
      should validate_presence_of(:username)
      should validate_presence_of(:password)
    end
  end
end
