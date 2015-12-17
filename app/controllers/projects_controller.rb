class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :destroy]

  def index
    @projects = Project.order('created_at DESC')
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params

    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def edit
  end

  

  private

  def project_params
    params.require(:project).permit(:title, :description, :link)
  end

  def find_project
    @project = Project.find(params[:id])
  end
end
