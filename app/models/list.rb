class List < ApplicationRecord
  belongs_to :user
  has_many :todos, dependent: :destroy
  accepts_nested_attributes_for :todos, allow_destroy: true

  validates :title, presence: true
end
