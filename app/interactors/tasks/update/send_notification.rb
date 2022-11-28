module Tasks
  class Update
    class SendNotification
      include Interactor

      delegate :task, to: :context

      def call
        context.project = task.project
        TaskMailer.task_updated(project, task).deliver_later
      end
    end
  end
end
