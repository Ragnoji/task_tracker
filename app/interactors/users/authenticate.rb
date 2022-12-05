module Users
  class Authenticate
    include Interactor::Organizer

    organize Users::CheckCredentials,
             Users::GenerateAccessToken
  end
end
