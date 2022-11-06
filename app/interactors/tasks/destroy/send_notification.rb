module Tasks
  class Destroy
    class SendNotification
      include Interactor

      delegate :project, :task, :user, to: :context

      def call
        mail_owner.deliver_later unless ProjectMembership.find_by(project: project, user: user).owner?
        mail_initiator.deliver_later
        mail_members.deliver_later
      end

      private

      def mail_owner
        @mail_owner ||= TaskMailer.task_destroyed_to_owner(project, task, user)
      end

      def mail_members
        @mail_members ||= TaskMailer.task_destroyed_to_members(project, task, user)
      end

      def mail_initiator
        @mail_initiator ||= TaskMailer.task_destroyed_to_initiator(project, task, user)
      end
    end
  end
end
