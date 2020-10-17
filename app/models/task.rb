class Task < ApplicationRecord
  validates :task_name, presence: true
  validates :deadline, presence: true
  validates :priority, presence: true, inclusion: { in: ["低","中","高"] }
  validates :status, presence: true, inclusion: { in: ["未着手","着手","完了"] }
end
