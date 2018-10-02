class ApplicationController < ActionController::Base
  include SessionsHelper

  protected

  def authenticate_user!
    if !logged_in?
      redirect_to login_path, notice: 'Please login first.'
    end
  end
end
