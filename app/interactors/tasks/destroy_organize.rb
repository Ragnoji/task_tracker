module Tasks
  class DestroyOrganize
    include Interactor::Organizer

    organize Tasks::Destroy, Tasks::Destroy::SendNotification
  end
end
