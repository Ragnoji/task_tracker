module Tasks
  class Update
    class SendNotification
      include Interactor

      delegate :project, :task, to: :context

      def call
        print 1
        mail_members.deliver_later
      end

      private

      def mail_members
        @mail_members ||= TaskMailer.task_updated(project, task)
      end
    end
  end
end
