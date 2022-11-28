module Types
  module Inputs
    class UpdateTaskInput < Types::BaseInputObject
      argument :id, ID, required: true
      argument :title, String, required: true
      argument :description, String, required: false
    end
  end
end
