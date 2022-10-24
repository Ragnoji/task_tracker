class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]
  before_action :set_task, only: %i[new index create destroy]

  def index
    @comments = @task.comments
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to project_task_comment_url(@task.project, @task, @comment), notice: "Comment was successfully created!"
    else
      flash.now[:notice] = "Something went wrong. Try again."
      render :new
    end
  end

  def destroy
    @comment.destroy
    redirect_to @task, notice: "Comment was successfully destroyed."
  end

  def show
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to project_task_comment_url(@comment.task.project, @comment.task, @comment),
                  notice: "Comment was successfully updated."
    else
      flash.now[:notice] = "Something went wrong. Try again."
      render :edit
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
    @task = @comment.task
    @project = @task.project
    authorize! @project, with: TaskPolicy
  end

  def set_task
    @task = Task.find(params[:task_id])
    @project = @task.project
    authorize! @project, with: TaskPolicy
  end

  def comment_params
    params.require(:comment).permit(:title, :description, :task_id)
  end
end
