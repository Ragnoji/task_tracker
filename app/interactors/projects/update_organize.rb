module Projects
  class UpdateOrganize
    include Interactor::Organizer

    organize Projects::Update,
             Projects::Update::SendNotification
  end
end
