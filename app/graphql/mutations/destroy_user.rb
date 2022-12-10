module Mutations
  class DestroyUser < BaseMutation
    include GraphqlErrors

    type Types::Payloads::DestroyUserPayload

    def resolve
      Users::Destroy.call(user: current_user)
    end
  end
end
