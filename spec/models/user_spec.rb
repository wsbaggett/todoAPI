require 'rails_helper'

RSpec.describe User, type: :model do
let(:user) { create(:user) }
# Shoulda tests for username
it { is_expected.to validate_presence_of(:username) }
it { is_expected.to validate_length_of(:username).is_at_least(1) }

# Shoulda tests for password
it { is_expected.to validate_presence_of(:password) }
#it { is_expected.to have_secure_password }
it { is_expected.to validate_length_of(:password).is_at_least(6) }

describe "attributes" do
  it "should have username attribute" do
    expect(user).to have_attributes(username: "TestUser1")
  end
 end

 describe "invalid user" do
     let(:user_with_invalid_username) { User.new(username: "") }

     it "should be an invalid user due to blank username" do
       expect(user_with_invalid_username).to_not be_valid
     end

   end
end
