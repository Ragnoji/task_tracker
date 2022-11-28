module Tasks
  class Create
    class SendNotification
      include Interactor

      delegate :task, to: :context

      def call
        TaskMailer.task_created_to_owner(task.project, task).deliver_later
        TaskMailer.task_created_to_members(task.project, task).deliver_later
      end
    end
  end
end
