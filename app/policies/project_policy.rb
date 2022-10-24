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

    return true if user.role.eql? "superadmin"

    permission = ProjectMembership.find_by(project: record, user: user)
    permission.present? && %w[owner member].include?(permission.role)
  end

  def destroy?
    return false if user.nil?

    return true if user.role.eql? "superadmin"

    ProjectMembership.find_by(project: record, user: user, role: "owner").present?
  end
end
