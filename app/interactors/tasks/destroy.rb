module Tasks
  class Destroy
    include Interactor::Organizer

    organize Tasks::Destroy, Tasks::Destroy::SendNotification

    include Interactor

    delegate :task, to: :context

    def call
      context.fail(error: "Invalid Data") unless task.destroy
    end
  end
end
