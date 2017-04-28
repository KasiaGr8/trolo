class BoardsController < ApplicationController
  # before_action :find_board, only: [:update, :destroy, :show, :edit] # callback, wywoła się przed akcjami w only: ...

  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to boards_path
    else
      render :new
    end
  end

  def edit
    board
  end

  def update
    if board.update(board_params)
      redirect_to boards_path
    else
      render :edit
    end
  end

  def destroy
    board.destroy
    redirect_to boards_path, notice: 'Board deleted'
  end

  def show
    board
  end

  private

  def find_board
    @board = Board.find(params[:id])
  end

  def board
    @board ||= Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:title)
  end
end