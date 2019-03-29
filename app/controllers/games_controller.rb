class GamesController < ApplicationController
before_action :logged_in_user, only: [:index, :edit, :update]
before_action :correct_user,   only: [:edit, :update]
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    #render plain: params[:game].inspect
    @game = Game.new(game_params)
    if (@game.save)
      redirect_to @game
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
      redirect_to @game
    else
      render 'edit'
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    redirect_to games_path
  end

private

  def game_params
    params.require(:game).permit(:title, :genre, :platform)
  end
end
