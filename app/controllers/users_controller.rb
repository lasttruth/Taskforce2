class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
  end

  def show
  end

  def new
     @user = User.new
  end

  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      flash[:success] = "Welcome to the Task Force!!"
       redirect_to @user
    else
    render 'new'
    end
  end

  def update
  end

  def destroy

  end

  private
  def user_params
      params.require(:user).permit(:email, :password,
                                   :password_confirmation)
    end
end
