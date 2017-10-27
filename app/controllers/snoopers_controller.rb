class SnoopersController < ApplicationController
  before_action :set_snooper, only: [:show, :edit, :update, :destroy]

  # GET /snoopers
  # GET /snoopers.json
  def index
    @snoopers = Snooper.all
  end

  # GET /snoopers/1
  # GET /snoopers/1.json
  def show
  end

  # GET /snoopers/new
  def new
    @snooper = Snooper.new
  end

  # GET /snoopers/1/edit
  def edit
  end

  # POST /snoopers
  # POST /snoopers.json
  def create
    @snooper = Snooper.new(snooper_params)

    respond_to do |format|
      if @snooper.save
        format.html { redirect_to @snooper, notice: 'Snooper was successfully created.' }
        format.json { render :show, status: :created, location: @snooper }
      else
        format.html { render :new }
        format.json { render json: @snooper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /snoopers/1
  # PATCH/PUT /snoopers/1.json
  def update
    respond_to do |format|
      if @snooper.update(snooper_params)
        format.html { redirect_to @snooper, notice: 'Snooper was successfully updated.' }
        format.json { render :show, status: :ok, location: @snooper }
      else
        format.html { render :edit }
        format.json { render json: @snooper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /snoopers/1
  # DELETE /snoopers/1.json
  def destroy
    @snooper.destroy
    respond_to do |format|
      format.html { redirect_to snoopers_url, notice: 'Snooper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_snooper
      @snooper = Snooper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def snooper_params
      params.require(:snooper).permit(:facebook_token, :facebook_event_url)
    end
end
