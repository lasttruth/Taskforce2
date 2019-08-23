class UserGamesController < ApplicationController

  def create
    @user = current_user
    @game = Game.find(params[:game_id])
    @user_game = @game.statuses.create(status_params)
    @user_game.user = @user
    @user_game.save

    redirect_to game_path(@game)
  end

  def edit
    @user = current_user
    @game = Game.find(params[:game_id])
    @user_game = @game.statuses.update(status_params)
    @user_game.user = @user
    @user_game.save
  end

  def update
    @user_game = Status.find(params[:id])

    redirect_to game_path(@game)
  end

  def destroy
    @user_game = Status.find(params[:id])
    @user_game.destroy
    redirect_to games_url
  end

  private
    def status_params
      Parameters: {"result"=>{"data"=>"string"}}
    end
  end
