module Tasks
  class Update
    class SendNotification
      include Interactor

      delegate :task, to: :context

      def call
        TaskMailer.task_updated(project, task).deliver_later
      end

      private

      def project
        task.project
      end
    end
  end
end
