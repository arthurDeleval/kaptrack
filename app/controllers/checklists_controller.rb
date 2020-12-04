class ChecklistsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  def index
    @checklists = policy_scope(Checklist).order(created_at: :desc)
  end

  def show
    @task = Task.new
    @checklist = Checklist.find(params[:id])
    authorize @checklist
  end

  def new
    @checklist = Checklist.new
    authorize @checklist
  end

  def create
    @checklist = Checklist.new(checklist_params)
    authorize @checklist
    if @checklist.save
      redirect_to checklists_path
    else
      render :new
    end
  end

  def edit
    @checklist = Checklist.find(params[:id])
    authorize @checklist
  end

  def update
    @checklist = Checklist.find(params[:id])
    authorize @checklist
    if @checklist.update(checklist_params)
      redirect_to checklist_path
    else
      render :edit
    end
  end

  def destroy
    @checklist = Checklist.find(params[:id])
    authorize @checklist
    @checklist.destroy
    redirect_to checklists_path
  end

  def checklist_params
    params.require(:checklist).permit(:title, :description, :deadline, :priority_level, :photo)
  end
end
