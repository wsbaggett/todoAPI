class List < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy

  validates :name, length: { minimum: 1 }, presence: true
  validates :permissions, length: { minimum: 1 }, presence: true
  validates :user, presence: true
end
