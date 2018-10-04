class HousesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_house, only: [:show, :edit, :update, :destroy]

  # GET /houses
  # GET /houses.json
  def index
    @houses = House.search(params)
  end

  # GET /houses/1
  # GET /houses/1.json
  def show
    initLists
  end

  # GET /houses/new
  def new
    initLists
    @house = House.new
    @real_estate_companies = RealEstateCompany.all
  end

  # GET /houses/1/edit
  def edit
    initLists
    @real_estate_companies = RealEstateCompany.all
  end

  # POST /houses
  # POST /houses.json
  def create
    initLists
    @real_estate_companies = RealEstateCompany.all
    @house = House.new(house_params)
    @house.user_id = current_user.id
    if(@house.real_estate_company_id.nil?)
      @house.real_estate_company_id = current_user.real_estate_company_id
    end

    respond_to do |format|
      if @house.save
        format.html do
          redirect_to @house, notice: 'House was successfully created.'
        end
        format.json { render :show, status: :created, location: @house }
      else
        format.html { render :new }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update
    initLists
    @real_estate_companies = RealEstateCompany.all
    respond_to do |format|
      if @house.update(house_params)
        format.html { redirect_to @house, notice: 'House was successfully updated.' }
        format.json { render :show, status: :ok, location: @house }
      else
        format.html { render :edit }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url, notice: 'House was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_house
    @house = House.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def house_params
    params.require(:house).permit(:name, :real_estate_company_id, :user_id, :house_style, :location, :sq_ft, :year, :price, :floors, :basement, :owner, :contact, images: [])
  end

  def initLists
    @potential_buyer = PotentialBuyer.find_by house_id: @house.id, user_id: current_user.id if house_hunter? || (admin? and !@house.nil?)
    @house_styles = HouseStyle.all
    @inquiries = Inquiry.where(user_id: current_user.id, house_id: @house.id) unless @house.nil?
    @potential_buyers = User.joins(:potential_buyers).where(potential_buyers: {house_id: @house.id}) if realtor? && !@house.nil?
  end
end
