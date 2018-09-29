class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.new
    @real_estate_companies = RealEstateCompany.all
  end
end
