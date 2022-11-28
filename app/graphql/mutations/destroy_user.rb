module Mutations
  class DestroyUser < BaseMutation
    include GraphqlErrors

    argument :input, Types::Inputs::DestroyUserInput, required: true

    type Types::Payloads::DestroyUserPayload

    def resolve(input:)
      user = User.find(input.id)
      return { errors: [{ message: "Not authorized", backtrace: [] }] } unless user.eql?(current_user) || user.admin?

      result = Users::Destroy.call(user: user)

      if result.success?
        result.to_h.merge(errors: [])
      else
        result.to_h.merge(errors: formatted_errors(result.user))
      end
    end
  end
end
