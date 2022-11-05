module Projects
  class Destroy
    include Interactor::Organizer

    organize Projects::Destroy,
             Projects::Destroy::SendNotification

    include Interactor

    delegate :project, to: :context

    def call
      context.fail(error: "Invalid Data") unless project.destroy
    end
  end
end
