class User < ApplicationRecord
  has_secure_password
  has_many :lists, dependent: :destroy

  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
