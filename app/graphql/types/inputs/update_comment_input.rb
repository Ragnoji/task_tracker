module Types
  module Inputs
    class UpdateCommentInput < Types::BaseInputObject
      argument :id, Integer, required: true
      argument :content, String, required: true
    end
  end
end
