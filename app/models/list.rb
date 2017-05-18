class List < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy

  validates :name, length: { minimum: 1 }, presence: true
  #validates :permissions, length: { minimum: 1 }, presence: true
  validates_inclusion_of :permissions, :in => %w(public private), :allow_blank => true
  validates :user, presence: true
end
