require 'rails_helper'

describe User, type: :model do
  subject(:user) do
    FactoryBot.build(:user,
      email: "jonathan@fakesite.com",
      password: "good_password")
  end

  describe 'validations:' do
    it {should validate_presence_of(:email) }
    it {should validate_presence_of(:pass_hash) }
    it {should validate_length_of(:password).is_at_least(5) }
  end
end
