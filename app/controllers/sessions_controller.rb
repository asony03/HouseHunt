class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to welcome_index_path
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def update
    switch_role params[:role].to_i
    redirect_to welcome_index_url
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
