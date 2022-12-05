module Types
  module Payloads
    class SignInPayload < Types::BaseObject
      field :access_token, String, null: true
      field :current_user, CurrentUserType, null: false, method: :user
      field :errors, [Types::UserError], null: true
    end
  end
end
