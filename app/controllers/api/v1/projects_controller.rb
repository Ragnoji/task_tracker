module Api
  module V1
    class ProjectsController < Api::ApplicationController
      before_action :set_project, only: %i[update destroy]

      def index
        @projects = Project.all
                           .order(params[:sort])
                           .page(params[:page])
                           .per(5)

        render json: { projects: @projects }
      end

      def create
        @project = create_project.project
        if create_project.success?
          render json: { project: @project, errors: @project.errors }
        else
          render json: { project: {}, errors: @project.errors }
        end
      end

      def update
        @project = update_project.project

        if update_project.success?
          render json: { project: @project, errors: @project.errors }
        else
          render json: { project: {}, errors: @project.errors }
        end
      end

      def destroy
        if destroy_project.success?
          render json: { project: @project, errors: @project.errors }
        else
          render json: { project: {}, errors: @project.errors }
        end
      end

      private

      def create_project
        @create_project ||=
          Projects::Create.call(project_params: project_params, user: current_user)
      end

      def update_project
        @update_project ||=
          Projects::Update.call(project_params: project_params, project: @project)
      end

      def destroy_project
        @destroy_project ||=
          Projects::Destroy.call(project: @project)
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_project
        @project = Project.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def project_params
        params.require(:project).permit(:name, :description)
      end
    end
  end
end
