class TasksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def create
    @checklist = Checklist.find(params[:checklist_id])
    @task = Task.new(task_params)
    @task.checklist = @checklist
    @task.save

    if @task.save
      redirect_to checklist_path(params[:checklist_id])
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to checklist_path(params[:checklist_id])
    else
      render :edit
    end
  end

  def task_params
    params.require(:task).permit(:description, :validation)
  end
end
