class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def new
    @task = Task.new # Needed to instantiate the form_with
  end

  def create
    @task = Task.new(task_params)
    @task.save
    # No need for app/views/tasks/create.html.erb
    redirect_to task_path(@task)
  end

  def edit
  end

  def update
    # @task.update(params[:task]) # Will raise ActiveModel::ForbiddenAttributesError
    @task.update(task_params)
    # No need for app/views/tasks/update.html.erb
    redirect_to task_path(@task)
  end

  def index
    @tasks = Task.all
  end

  def show
  end

  def destroy
    @task.destroy
    # No need for app/views/tasks/destroy.html.erb
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
