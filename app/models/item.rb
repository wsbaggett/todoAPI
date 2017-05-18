class Item < ApplicationRecord
  belongs_to :list

  validates :description, length: { minimum: 2 }, presence: true
  validates :list, presence: true
  #validates :completed, inclusion: { in: [true, false, nil], message: "%{completed} is not valid." }, presence: true
  validates_inclusion_of :completed, :in => %w(true false), :allow_blank => true
end
