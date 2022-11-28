module Tasks
  class Create
    class SendNotification
      include Interactor

      delegate :task, to: :context

      def call
        context.project = task.project
        TaskMailer.task_created_to_owner(project, task).deliver_later
        TaskMailer.task_created_to_members(project, task).deliver_later
      end
    end
  end
end
