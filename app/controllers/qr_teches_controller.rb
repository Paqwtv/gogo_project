class QrTechesController < ApplicationController
  before_action :set_qr_tech, only: [:show, :edit, :update, :destroy]

  # GET /qr_teches
  # GET /qr_teches.json
  def index
    @qr_teches = QrTech.all
  end

  # GET /qr_teches/1
  # GET /qr_teches/1.json
  def show
  end

  # GET /qr_teches/new
  def new
    @qr_tech = QrTech.new
  end

  # GET /qr_teches/1/edit
  def edit
  end

  # POST /qr_teches
  # POST /qr_teches.json
  def create
    @qr_tech = QrTech.new(qr_tech_params)

    respond_to do |format|
      if @qr_tech.save
        format.html { redirect_to @qr_tech, notice: 'Qr tech was successfully created.' }
        format.json { render :show, status: :created, location: @qr_tech }
      else
        format.html { render :new }
        format.json { render json: @qr_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qr_teches/1
  # PATCH/PUT /qr_teches/1.json
  def update
    respond_to do |format|
      if @qr_tech.update(qr_tech_params)
        format.html { redirect_to @qr_tech, notice: 'Qr tech was successfully updated.' }
        format.json { render :show, status: :ok, location: @qr_tech }
      else
        format.html { render :edit }
        format.json { render json: @qr_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qr_teches/1
  # DELETE /qr_teches/1.json
  def destroy
    @qr_tech.destroy
    respond_to do |format|
      format.html { redirect_to qr_teches_url, notice: 'Qr tech was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qr_tech
      @qr_tech = QrTech.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qr_tech_params
      params.require(:qr_tech).permit(:qr_code)
    end
end
