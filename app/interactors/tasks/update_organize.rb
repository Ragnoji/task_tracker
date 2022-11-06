module Tasks
  class UpdateOrganize
    include Interactor::Organizer

    organize Tasks::Update, Tasks::Update::SendNotification
  end
end
