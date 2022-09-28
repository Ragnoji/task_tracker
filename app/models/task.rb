class Task < ApplicationRecord
  belongs_to :project

  validates :project, presence: true
  validates :title, presence: true
  validate :deadline_later

  private

  def deadline_later

    unless (!created_at.nil? && created_at < deadline_at) || (created_at.nil? && Time.now.to_datetime < deadline_at)
      errors.add(:deadline_at, "must be after creation time")
    end
  end
end
