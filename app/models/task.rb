class Task < ApplicationRecord
  belongs_to :project
  validates :project, presence: true
  validates :title, presence: true
  validate :deadline_after_creation

  private
  def deadline_after_creation
    errors.add(:deadline_at, "must be after creation time") unless (!created_at.nil? and created_at < deadline_at) or Time.now.to_datetime < deadline_at
  end
end
