class TicketsController < ApplicationController
  def new
    @ticket = list.tickets.new
  end

  def create
    @ticket = list.tickets.new(ticket_params)
    if @ticket.save
      redirect_to board_list_path(list.board, list), notice: 'Ticket was successfully created!'
    else
      render :new
    end
  end

  def edit
    ticket
  end

  def update
    if ticket.update(ticket_params)
      redirect_to board_list_path(list.board, list)
    else
      render :new
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :status)
  end

  def list
    @list ||= List.find(params[:list_id])
  end

  def ticket
    @ticket ||= list.tickets.find(params[:id])
  end
end
