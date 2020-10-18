class Task < ApplicationRecord
  validates :task_name, presence: true
  validates :deadline, presence: true
  validates :priority, presence: true
  validates :status, presence: true
end
