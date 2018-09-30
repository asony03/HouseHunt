class InquiriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_inquiry, only: [:show, :edit, :update, :destroy]

  # GET /inquiries
  # GET /inquiries.json
  def index
    @inquiries =
      if house_hunter?
        Inquiry.where(user_id: current_user.id)
      elsif realtor?
        Inquiry.joins(:house).where(houses: { real_estate_company_id: current_user.real_estate_company.id} )
      else
        Inquiry.all
      end
    @inquiries = @inquiries.sort_by(&:updated_at).reverse
  end

  # GET /inquiries/1
  # GET /inquiries/1.json
  def show
  end

  # GET /inquiries/new
  def new
    @houses = House.all
    @inquiry = Inquiry.new
  end

  # GET /inquiries/1/edit
  def edit
    @houses = House.all
  end

  # POST /inquiries
  # POST /inquiries.json
  def create
    @houses = House.all
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.user_id = current_user.id

    respond_to do |format|
      if @inquiry.save
        format.html { redirect_to @inquiry.reply.nil? ? house_path(@inquiry.house_id) : @inquiry, notice: 'Inquiry was successfully created.' }
        format.json { render :show, status: :created, location: @inquiry }
      else
        format.html { render :new }
        format.json { render json: @inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inquiries/1
  # PATCH/PUT /inquiries/1.json
  def update
    @houses = House.all
    respond_to do |format|
      if @inquiry.update(inquiry_params)
        format.html { redirect_to @inquiry, notice: 'Inquiry was successfully updated.' }
        format.json { render :show, status: :ok, location: @inquiry }
      else
        format.html { render :edit }
        format.json { render json: @inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inquiries/1
  # DELETE /inquiries/1.json
  def destroy
    @inquiry.destroy
    respond_to do |format|
      format.html { redirect_to inquiries_url, notice: 'Inquiry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inquiry
      @inquiry = Inquiry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inquiry_params
      params.require(:inquiry).permit(:user, :house_id, :subject, :msg, :reply)
    end
end
