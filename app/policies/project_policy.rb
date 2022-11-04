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

    membership = ProjectMembership.find_by(project: record, user: user)
    membership.present? && (membership.member? || membership.owner?)
  end

  def destroy?
    return false if user.nil?

    membership = ProjectMembership.find_by(project: record, user: user)
    membership.present? && membership.owner?
  end
end
