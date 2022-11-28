module Types
  module Payloads
    class DestroyUserPayload < Types::BaseObject
      field :user, UserType, null: true
      field :errors, [Types::UserError], null: false
    end
  end
end
