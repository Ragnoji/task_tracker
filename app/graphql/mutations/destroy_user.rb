module Mutations
  class DestroyUser < BaseMutation
    include GraphqlErrors

    argument :input, Types::Inputs::DestroyUserInput, required: true

    type Types::Payloads::DestroyUserPayload

    def resolve(input:)
      user = User.find(input.id)

      result = Users::Destroy.call(user: user)

      result.to_h.merge(errors: formatted_errors(result.user))
    end
  end
end
