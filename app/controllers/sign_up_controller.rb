class SignUpController < ApplicationController
  def new
    @user = User.new
    @real_estate_companies = RealEstateCompany.all
  end
end
