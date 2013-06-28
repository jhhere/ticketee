class TicketsController < ApplicationController
  before_action :set_project
  before_action :set_ticket, only: [:show, :update, :destroy]

	def new
	  p '---new---'
      p params
      p '---new---'
	  @ticket = @project.tickets.build
	end

	def create
	  p '---create---'
      p params
      p '---create---'
      @ticket = @project.tickets.build(ticket_params)
      if @ticket.save
      	flash[:notice] = "Ticket has been created."
      	redirect_to [@project, @ticket]
      else
      	flash[:alert] = "Ticket has not been created."
      	render :action => "new"
      end
	end

	def show
	  p '---show---'
      p params
      p '---show---'
	end
  
  private
    def set_ticket
      @ticket = @project.tickets.find(params[:id])
    end
    def set_project
      @project = Project.find(params[:project_id])
    end

    def ticket_params
      params.require(:ticket).permit(:title, :description)
    end

end