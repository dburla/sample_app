class Todo < ApplicationRecord
  validates :text, presence: true, length: { maximum: 500 }
  
  scope :completed, -> { where(completed: true) }
  scope :incomplete, -> { where(completed: false) }
end