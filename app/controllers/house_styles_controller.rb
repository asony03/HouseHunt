class HouseStylesController < ApplicationController
  before_action :set_house_style, only: [:show, :edit, :update, :destroy]

  # GET /house_styles
  # GET /house_styles.json
  def index
    @house_styles = HouseStyle.all
  end

  # GET /house_styles/1
  # GET /house_styles/1.json
  def show
  end

  # GET /house_styles/new
  def new
    @house_style = HouseStyle.new
  end

  # GET /house_styles/1/edit
  def edit
  end

  # POST /house_styles
  # POST /house_styles.json
  def create
    @house_style = HouseStyle.new(house_style_params)

    respond_to do |format|
      if @house_style.save
        format.html { redirect_to @house_style, notice: 'House style was successfully created.' }
        format.json { render :show, status: :created, location: @house_style }
      else
        format.html { render :new }
        format.json { render json: @house_style.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /house_styles/1
  # PATCH/PUT /house_styles/1.json
  def update
    respond_to do |format|
      if @house_style.update(house_style_params)
        format.html { redirect_to @house_style, notice: 'House style was successfully updated.' }
        format.json { render :show, status: :ok, location: @house_style }
      else
        format.html { render :edit }
        format.json { render json: @house_style.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /house_styles/1
  # DELETE /house_styles/1.json
  def destroy
    @house_style.destroy
    respond_to do |format|
      format.html { redirect_to house_styles_url, notice: 'House style was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house_style
      @house_style = HouseStyle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_style_params
      params.require(:house_style).permit(:name)
    end
end
