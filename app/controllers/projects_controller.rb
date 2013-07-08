class ProjectsController < ApplicationController
	before_action :authorize_admin!, except: [:index, :show]
	before_action :require_signin!, only: [:show]
	before_action :set_project, only: [:show,
									   :edit,
									   :update,
									   :destroy]

	def index
        p '---index---'
		p params
		p '---index---'
		@projects = Project.all
	end

	def new
		p '---new---'
		p params
		p '---new---'
		@project = Project.new

	end

	def create
        p '---create---'
		p params
		p '---create---'

		@project = Project.new(project_params)

		if @project.save
			flash[:notice] = "Project has been created."
			redirect_to @project
		else
			flash[:alert] = "Project has not been created."

			render :action => "new"
		end

	end	

	def show
	  p '---show---'
      p params
      p '---show---'
	end

    def edit
      p '---edit---'
      p params
      p '---edit---'
    end 

    def update
      p '---update---'
      p params
      p '---update---'
      
      if @project.update(project_params)
        flash[:notice] = "Project has been updated."
        redirect_to @project
      else
      	flash[:alert] = "Project has not been updated."
      	render action: "edit"
      end

    end

    def destroy
      p '---destroy---'
      p params
      p '---destroy---'
      @project = Project.find(params[:id])
      @project.destroy

      flash[:notice] = "Project has been destroyed."

      redirect_to projects_path
    end

	private

	  def set_project
	  	@project = if current_user.admin?
	      Project.find(params[:id])
	    else
	      Project.viewable_by(current_user).find(params[:id])
	    end
	  rescue ActiveRecord::RecordNotFound
	    flash[:alert] = "The project you were looking" + " for could not be found."

	    redirect_to projects_path	
	  end

	  def project_params
        params.require(:project).permit(:name, :description)
      end
end
