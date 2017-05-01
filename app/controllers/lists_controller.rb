class ListsController < ApplicationController

  def new
    @list = board.lists.new
  end

  def create
    @list = board.lists.new(list_params)
    if @list.save
      redirect_to board_path(board)
    else
      render :new
    end
  end

  def edit
    list
  end

  def update
    if list.update(list_params)
      redirect_to board_path(board)
    else
      render :edit
    end
  end 

  def show
  end

  def destroy
    list.destroy
    redirect_to board_path(board)
  end

  private

  def board
    @board ||= Board.find(params[:board_id])
  end

  def list_params
    params.require(:list).permit(:title)
  end

  def list
    @list ||= board.lists.find(params[:id])
  end
end