module Types
  module Inputs
    class DestroyUserInput < Types::BaseInputObject
      argument :id, Integer, required: true
    end
  end
end
