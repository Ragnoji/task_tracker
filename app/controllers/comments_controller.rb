class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]
  before_action :set_task, only: %i[create destroy]
  before_action :set_project
  before_action -> { authorize! @project, with: CommentPolicy }

  def create
    @comment = Comment.new(comment_params)
    @comment.task = @task
    @comment.author_id = current_user.id

    if @comment.save
      redirect_to project_task_url(@task.project, @task), notice: "Comment was successfully created!"
    else
      flash.now[:notice] = "Something went wrong. Try again."
      render "tasks/show"
    end
  end

  def destroy
    @comment.destroy
    redirect_to project_task_url(@project, @task), notice: "Comment was successfully destroyed."
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to project_task_url(@project, @comment.task),
                  notice: "Comment was successfully updated."
    else
      flash.now[:notice] = "Something went wrong. Try again."
      render :edit
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
