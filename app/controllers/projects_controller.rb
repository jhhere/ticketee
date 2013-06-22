class ProjectsController < ApplicationController
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
	  @project = Project.find(params[:id])
	end

    def edit
    	@project = Project.find(params[:id])
    end 

    def update
      p '---update---'
      p params
      p '---update---'
      @project = Project.find(params[:id])
      if @project.update(project_params)
        flash[:notice] = "Project has been updated."
        redirect_to @project
      else
      	flash[:alert] = "Project has not been updated."
      	render action: "edit"
      end

    end

	private

	  def project_params
        params.require(:project).permit(:name, :description)
      end
end
