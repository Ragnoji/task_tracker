module Mutations
  class DestroyUser < BaseMutation
    include GraphqlErrors

    type Types::Payloads::DestroyUserPayload

    def resolve
      result = Users::Destroy.call(user: current_user)

      result.to_h.merge(errors: formatted_errors(result.user))
    end
  end
end
