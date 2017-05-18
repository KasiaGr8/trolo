class BoardCreator
  attr_reader :board

  def initialize(board_params)
    @board_params = board_params
  end

  def save
    return false unless board.valid?
    create_board_with_member
    true
  end

  private

  def create_board_with_member
    ActiveRecord::Base.transaction do
      board.save
      board.members.create!(user_id: @board_params[:owner_id])
    end
  end

  def board
    @board ||= Board.new(@board_params)
  end
end