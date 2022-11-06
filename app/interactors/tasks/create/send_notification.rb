module Tasks
  class Create
    class SendNotification
      include Interactor

      delegate :project, :task, to: :context

      def call
        mail_owner.deliver_later
        mail_members.deliver_later
      end

      private

      def mail_owner
        @mail_owner ||= TaskMailer.task_created_to_owner(project, task)
      end

      def mail_members
        @mail_members ||= TaskMailer.task_created_to_members(project, task)
      end
    end
  end
end
