module Projects
  class DestroyOrganize
    include Interactor::Organizer

    organize Projects::Destroy,
             Projects::Destroy::SendNotification
  end
end
