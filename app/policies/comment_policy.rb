class CommentPolicy < ApplicationPolicy
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
    return false if user.nil?

    membership = ProjectMembership.find_by(project: record.task.project, user: user)
    membership.present? && (membership.member? || membership.owner?)
  end
end
