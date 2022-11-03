class ProjectPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def index?
    true
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    user.present?
  end

  def edit?
    update?
  end

  def update?
    return false if user.nil?

    ProjectMembership.find_by(project: record, user: user).present?
  end

  def destroy?
    return false if user.nil?

    ProjectMembership.find_by(project: record, user: user, role: "owner").present?
  end
end
