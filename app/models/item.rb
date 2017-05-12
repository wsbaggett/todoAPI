class Item < ApplicationRecord
  belongs_to :list

  validates :description, length: { minimum: 2 }, presence: true
  validates :list, presence: true
end
