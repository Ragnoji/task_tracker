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
    ProjectMembership.find_by(project: record.task.project, user: user).present?
  end
end
