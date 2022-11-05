class CommentPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def create?
    member?
  end

  def destroy?
    member?
  end

  def edit?
    member?
  end

  def update?
    member?
  end

  def member?
    user.present? && ProjectMembership.find_by(project: record.task.project, user: user).present?
  end
end
