class StatusesController < ApplicationController

  def create
    @game = Game.find(params[:game_id])
    @status = @game.statuses.create(status_params)
    @status.user = current_user
    @status.save

    if @status.save
      redirect_to user_games_path(@game)
    else
      render 'new'
    end
  end


  def destroy
    @status = Status.find(params[:id])
    @status.destroy
    redirect_to games_url
  end

  private
    def status_params
      params.require(:status).permit(:condition, :completion)
    end

end
