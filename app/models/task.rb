class Task < ApplicationRecord
  belongs_to :list
  belongs_to :user, optional: true


  belongs_to :parent, class_name: 'Task', optional: true
  has_many :subtasks, class_name: 'Task', foreign_key: 'parent_id', dependent: :destroy


  scope :completed, -> { where(completed: true) }
  scope :pending, -> { where(completed: false) }


  validates :title, presence: true


  def mark_completed!
  update(completed: true, completed_at: Time.current)
  end


  def mark_pending!
  update(completed: false, completed_at: nil)
  end
end