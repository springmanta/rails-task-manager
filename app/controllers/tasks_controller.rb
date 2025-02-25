class TasksController < ApplicationController
  before_action :set_task, only: [:create, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
    @tasks = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task.save

    redirect_to tasks_path(@task)
  end

  def edit; end

  def update
    @task.update(task_params)

    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy

    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:name, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
