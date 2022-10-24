class TaskPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def index?
    member?
  end

  def new?
    member?
  end

  def create?
    member?
  end

  def destroy?
    member?
  end

  def show?
    member?
  end

  def edit?
    member?
  end

  def update?
    member?
  end

  def member?
    user.present? && ProjectMembership.find_by(project: record, user: user).present?
  end
end
