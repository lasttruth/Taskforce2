class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def hello
    render html: "New Begining I guess"
  end

  def authenticate
    redirect_to :login unless logged_in?
  end
end
