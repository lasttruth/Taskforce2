class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    if current_user
        @user = User.new
    else
        redirect_to sign_in_path
    end
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
    @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        flash[:success] = "Profile updated"
        redirect_to @user
      else
        render 'edit'
      end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private
  def user_params
      params.require(:user).permit(:email, :password,
                                   :password_confirmation)
    end
end
