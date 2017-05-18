class BoardsController < ApplicationController
  # before_action :find_board, only: [:update, :destroy, :show, :edit] # callback, wywoła się przed akcjami w only: ...

  def index
    @own_boards = current_user.boards.where(owner_id: current_user.id)
    @member_boards = current_user.boards.where.not(owner_id: current_user.id)
  end

  def new
    @board = Board.new
  end

  def create
    service = BoardCreator.new(board_params.merge!(owner_id: current_user.id))
    if service.save
      redirect_to boards_path
    else
      @board = service.board
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

  # mozna tej metody uzyc do before_action
  # def find_board
  #   @board = Board.find(params[:id])
  # end

  def board
    @board ||= Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:title)
  end
end