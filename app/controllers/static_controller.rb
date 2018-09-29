class StaticController < ApplicationController
  before_action :authenticate_user!
  def show
    render params[:page]
  end
end
