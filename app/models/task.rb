class Task < ApplicationRecord
  belongs_to :project

  validates :project, presence: true
  validates :title, presence: true
  validate :deadline_possibility

  private

  def deadline_possibility
    unless (!created_at.nil? && created_at < deadline_at) || (created_at.nil? && Time.now.to_datetime < deadline_at)
      errors.add(:deadline_at, "must be after creation time")
    end
  end
end
