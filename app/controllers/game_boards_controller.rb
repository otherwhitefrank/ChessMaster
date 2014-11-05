class GameBoardsController < ApplicationController
  before_action :set_game_board, only: [:show, :edit, :update, :destroy]

  def index
    @game_boards = GameBoard.all
    respond_with(@game_boards)
  end

  def show
    respond_with(@game_board)
  end

  def new
    @game_board = GameBoard.new
    respond_with(@game_board)
  end

  def edit
  end

  def create
    @game_board = GameBoard.new(game_board_params)
    @game_board.save
    respond_with(@game_board)
  end

  def update
    @game_board.update(game_board_params)
    respond_with(@game_board)
  end

  def destroy
    @game_board.destroy
    respond_with(@game_board)
  end

  private
    def set_game_board
      @game_board = GameBoard.find(params[:id])
    end

    def game_board_params
      params.require(:game_board).permit(:set_of_pieces, :list_of_moves, :winner, :loser, :user_id_1, :user_id_2, :active?, :turn)
    end
end
