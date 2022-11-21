module Resolvers
  class Tasks < Resolvers::Base
    argument :project_id, ID, required: true

    type [Types::TaskType], null: false

    def resolve(**options)
      ::Task.where(project_id: options[:project_id])
    end
  end
end
