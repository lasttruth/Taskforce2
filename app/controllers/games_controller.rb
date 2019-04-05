class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new(user_id: params[:user_id])
  end

  def create
    #render plain: params[:game].inspect
    @game = Game.new(game_params)
    if (@game.save)
      redirect_to user_games_path
    else
      render 'new'
    end
  end

  def edit
      @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if (@game.update(game_params))
      redirect_to user_games_path
    else
      render 'edit'
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    redirect_to user_games_path
  end

private

  def game_params
    params.require(:game).permit(:title, :genre, :platform, :user_id)
  end
end
