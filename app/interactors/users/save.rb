module Users
  class Save
    include Interactor::Organizer

    organize Users::Save::Execute,
             Users::GenerateAccessToken
  end
end
