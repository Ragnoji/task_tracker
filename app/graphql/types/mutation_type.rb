module Types
  class MutationType < Types::BaseObject
    field :create_project, mutation: Mutations::CreateProject
    field :destroy_user, mutation: Mutations::DestroyUser
  end
end
