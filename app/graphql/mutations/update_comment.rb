module Mutations
  class UpdateComment < BaseMutation
    include GraphqlErrors

    argument :input, Types::Inputs::UpdateCommentInput, required: true

    type Types::Payloads::UpdateCommentPayload

    def resolve(input:)
      comment_params = input.to_h.except(:id)
      comment = Comment.find(input.id)
      return { errors: [{ message: "Not authorized", backtrace: [] }] } unless comment.user.eql? current_user

      result = Comments::Update.call(comment: comment, comment_params: comment_params)

      if result.success?
        result.to_h.merge(errors: [])
      else
        result.to_h.merge(errors: formatted_errors(result.project))
      end
    end
  end
end
