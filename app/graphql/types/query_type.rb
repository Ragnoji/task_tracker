module Types
  class QueryType < Types::BaseObject
    field :project, resolver: Resolvers::Project
    field :projects, resolver: Resolvers::Projects

    field :tasks, resolver: Resolvers::Tasks
    field :task, resolver: Resolvers::Task
  end
end
