require 'rails_helper'

RSpec.describe Item, type: :model do
  let (:user) { create(:user) }
  let (:list) { create(:list)}
  let (:item) { create(:item)}
  # Shoulda tests for description
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_length_of(:description).is_at_least(2) }
  it { is_expected.to validate_inclusion_of(:completed).in_array(%w(true false)) }

  it { is_expected.to belong_to(:list) }

  describe "attributes" do
    it "should have description attribute" do
      expect(item).to have_attributes(description: "MyToDoItem")
    end

   end
end
