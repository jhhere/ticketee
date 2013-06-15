class ProjectsController < ApplicationController
	def index
        p '--------------'
		p params
		p '--------------'
	end

	def new
		@project = Project.new
		p '--------------'
		p params
		p '--------------'
	end

	def create
        p '--------------'
		p params
		p '--------------'

		@project = Project.new(project_params)

		if @project.save
			flash[:notice] = "Project has been created."
			redirect_to @project
		else
			# nothing, yet
		end

	end	

	def show
	  @project = Project.find(params[:id])
	end

	private

	  def project_params
        params.require(:project).permit(:name, :description)
      end
end
