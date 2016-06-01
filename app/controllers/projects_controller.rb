class ProjectsController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @projects = Project.order(:updated_at)
  end

  def show
    @project = Project.find params[:id]
  end
end
