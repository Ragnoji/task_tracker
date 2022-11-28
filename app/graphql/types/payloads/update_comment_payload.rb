module Types
  module Payloads
    class UpdateCommentPayload < Types::BaseObject
      field :comment, CommentType, null: true
      field :errors, [Types::UserError], null: false
    end
  end
end
