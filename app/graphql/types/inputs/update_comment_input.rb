module Types
  module Inputs
    class UpdateCommentInput < Types::BaseInputObject
      argument :comment_id, ID, required: true
      argument :content, String, required: false
    end
  end
end
