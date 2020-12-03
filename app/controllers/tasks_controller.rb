class TasksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
    @tasks = policy_scope(Task).order(created_at: :desc)
  end

  def create
    @checklist = Checklist.find(params[:checklist_id])
    @task = Task.new(task_params)
    @task.checklist = @checklist
    @task.save
    authorize @task
    if @task.save
      redirect_to checklist_path(params[:checklist_id])
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
    authorize @task
  end

  def update
    @task = Task.find(params[:id])
    authorize @task
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
