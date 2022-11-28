module Mutations
  class UpdateTask < BaseMutation
    include GraphqlErrors

    argument :input, Types::Inputs::UpdateTaskInput, required: true

    type Types::Payloads::UpdateTaskPayload

    def resolve(input:)
      task = Task.find(input.id)
      return { errors: [{ message: "Not member of project", backtrace: [] }] } unless member? task

      task_params = input.to_h.except(:id)
      result = Tasks::Update.call(task: task, task_params: task_params, user: current_user)

      if result.success?
        result.to_h.merge(errors: [])
      else
        result.to_h.merge(errors: formatted_errors(result.task))
      end
    end

    private

    def member?(task)
      ProjectMembership.find_by(project: task.project, user: current_user).present?
    end
  end
end
