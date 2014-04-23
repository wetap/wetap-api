class WaterFountainsController < ApplicationController
  before_action :set_water_fountain, only: [:show, :update, :destroy]

  # TODO create api auth mechanism
  skip_before_filter :verify_authenticity_token, :only=> [:create, :update, :destroy]

  # GET /water_fountains
  # GET /water_fountains.json
  def index
    @water_fountains = WaterFountain.all
    if params[:bbox]
      bbox_params = sanitize_bbox_params(params[:bbox])
      @water_fountains = @water_fountains.bounded_by(bbox_params)

    end
  end

  # GET /water_fountains/1
  # GET /water_fountains/1.json
  def show
  end

  # POST /water_fountains
  # POST /water_fountains.json
  def create
    @water_fountain = WaterFountain.new(water_fountain_params)

    respond_to do |format|
      if @water_fountain.save
        format.json { render action: 'show', status: :created, location: @water_fountain }
      else
        format.json { render json: { error: @water_fountain.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /water_fountains/1
  # PATCH/PUT /water_fountains/1.json
  def update
    respond_to do |format|
      if @water_fountain.update(water_fountain_params)
        format.json { head :no_content }
      else
        format.json { render json: { error: @water_fountain.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /water_fountains/1
  # DELETE /water_fountains/1.json
  def destroy
    @water_fountain.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_water_fountain
      @water_fountain = WaterFountain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def water_fountain_params
      sanitized_params = params.require(:water_fountain).permit(location: [:type,
                                                                           {coordinates: []}
      ])
      sanitized_params
    end

    def sanitize_bbox_params(param)
      bbox_params = param.split(',').map {|v| v.to_f }
      if bbox_params.length != 4
        respond_to do |format|
          format.json { render json: { error: "bbox param is formatted incorrectly" }, status: :bad_request }
        end
      end
      bbox_params
    end

end
