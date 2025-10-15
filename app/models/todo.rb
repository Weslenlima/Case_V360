class Todo < ApplicationRecord
  belongs_to :list

  validates :title, presence: true

  after_initialize :set_default_completed, if: :new_record?

  def set_default_completed
    self.completed ||= false
  end
end
