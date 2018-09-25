class RealEstateCompaniesController < ApplicationController
  def index
    @real_estate_companies = RealEstateCompany.all
  end

  def show
    @real_estate_company = RealEstateCompany.find(params[:id])
  end

  def new
    @real_estate_company = RealEstateCompany.new
  end

  def create
    @real_estate_company = RealEstateCompany.new(params.require(:real_estate_company).permit(:name,:website,:address,:size,:founded,:revenue,:synopsis))
    if @real_estate_company.save
      redirect_to @real_estate_company
    else
      render :new
    end

  end

  def edit
    @real_estate_company = RealEstateCompany.find(params[:id])
  end

  def update
    @real_estate_company = RealEstateCompany.find(params[:id])
    if @real_estate_company.update(params.require(:real_estate_company).permit(:name,:website,:address,:size,:founded,:revenue,:synopsis))
      redirect_to @real_estate_company
    else
      render :edit
    end
  end

  def destroy
    @real_estate_company = RealEstateCompany.find(params[:id])
    @real_estate_company.destroy
    redirect_to real_estate_companies_path
  end
end
