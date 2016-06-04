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
    @project.links.build
  end

  def update
    p = project_params
    logger.debug "==============================="
    logger.debug p.inspect
    logger.debug "==============================="
    @project.update(p)
    if @project.errors.empty?
      flash[:notice] = "saved."
      url = project_path(params[:id])
    else
      flash[:notice] = "errors: #{@project.errors.full_messages}"
      url = edit_project_path(params[:id])
    end
    redirect_to url
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
