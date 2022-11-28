module Tasks
  class Destroy
    class SendNotification
      include Interactor

      delegate :task, :user, to: :context

      def call
        mail_owner.deliver_later unless initiator_is_owner?
        TaskMailer.task_destroyed_to_initiator(task.project, task, user).deliver_later
        TaskMailer.task_destroyed_to_members(task.project, task, user).deliver_later
      end

      private

      def mail_owner
        TaskMailer.task_destroyed_to_owner(task.project, task)
      end

      def initiator_is_owner?
        ProjectMembership.find_by(project: task.project, user: user).owner?
      end
    end
  end
end
