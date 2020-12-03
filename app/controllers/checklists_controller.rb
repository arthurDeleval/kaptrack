class ChecklistsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  def index
    @checklists = Checklist.all
  end

  def show
    @task = Task.new
    @checklist = Checklist.find(params[:id])
  end

  def new
    @checklist = Checklist.new
  end

  def create
    @checklist = Checklist.new(checklist_params)
    @checklist.save

    if @checklist.save
      redirect_to checklists_path
    else
      render :new
    end
  end

  def edit
    @checklist = Checklist.find(params[:id])
  end

  def update
    @checklist = Checklist.find(params[:id])
    if @checklist.update(checklist_params)
      redirect_to checklists_path
    else
      render :edit
    end
  end

  def destroy
    @checklist = Checklist.find(params[:id])
    @checklist.destroy
    redirect_to checklists_path
  end

  def checklist_params
    params.require(:checklist).permit(:title, :description, :deadline, :priority_level)
  end
end
