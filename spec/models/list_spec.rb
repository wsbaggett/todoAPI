require 'rails_helper'

RSpec.describe List, type: :model do
  let(:user) { create(:user) }
  let (:list) { create(:list)}
  # Shoulda tests for name
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(1) }

  # Shoulda tests for permissions
  it { is_expected.to validate_presence_of(:permissions) }
  it { is_expected.to validate_length_of(:permissions).is_at_least(1) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:items) }

  describe "attributes" do
    it "should have name attribute" do
      expect(list).to have_attributes(name: "MyToDoList")
    end

    it "should have permissions attribute" do
      expect(list).to have_attributes(permissions: "public")
    end
   end

end
