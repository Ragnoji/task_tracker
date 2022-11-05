module Projects
  class Update
    include Interactor::Organizer

    organize Projects::Update,
             Projects::Update::SendNotification

    include Interactor

    delegate :project, :project_params, to: :context

    def call
      context.fail(error: "Invalid Data") unless project.update(project_params)
    end
  end
end
