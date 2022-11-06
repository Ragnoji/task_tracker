class TaskMailer < ApplicationMailer
  def task_created_to_members(project, task)
    @project = project
    @task = task

    mail(to: ProjectMembership.where(role: :member, project: project).map { |p| p.user.email })
  end

  def task_created_to_owner(project, task)
    @project = project
    @task = task

    mail(to: ProjectMembership.find_by(role: :owner, project: project).user.email)
  end

  def task_updated(project, task)
    @project = project
    @task = task

    mail(to: project.users.map(&:email))
  end

  def task_destroyed_to_initiator(project, task, user)
    @project = project
    @task = task

    mail(to: user.email)
  end

  def task_destroyed_to_owner(project, task, user)
    @project = project
    @task = task
    @user = user

    mail(to: ProjectMembership.find_by(role: :owner, project: project).user.email)
  end

  def task_destroyed_to_members(project, task, user)
    @project = project
    @task = task
    @user = user

    recipients = ProjectMembership.where(role: :member, project: project)
                                  .filter_map { |p| p.user.email unless p.user.eql? user }

    mail(to: recipients)
  end
end
