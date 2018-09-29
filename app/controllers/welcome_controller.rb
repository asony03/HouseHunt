class WelcomeController < ApplicationController
  def index
    @user = User.new
    @real_estate_companies = RealEstateCompany.all
  end
end
