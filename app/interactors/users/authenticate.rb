module Users
  class Authenticate
    include Interactor::Organizer

    organize Users::Authenticate::Execute,
             Users::GenerateAccessToken
  end
end
