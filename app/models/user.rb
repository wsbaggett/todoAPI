class User < ApplicationRecord
  has_many :lists, dependent: :destroy

  validates :username, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, presence: true, length: { minimum: 6 }, if: "password.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true

  #has_secure_password
end
