class ProjectsController < ApplicationController

  before_action :authenticate_user!
  before_action :load_object, only: [:show, :edit, :update]

  def index
    @projects = Project.order(id: :desc)
  end

  def show
  end

  def edit
    @project.swagger_definitions.build
  end

  def update
    @project.update(project_params)
    flash[:notice] = "saved."
    redirect_to @project
  end

  private
  def load_object
    @project = Project.find params[:id]
  end

  def project_params
    #params.require(:project).permit(:name, :notes, swagger_definitions_attributes: [])
    params.require(:project).permit!
  end
end
