class SessionsController < ApplicationController

  def new
    if current_user
      redirect_to users_path
    else
      @user = User.new
    end
   end

   def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      redirect_to user
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      redirect_to login_path
    end
   end

   def destroy
     log_out
     redirect_to root_url
   end

end
