class Api::V1::WaterFountainsController < ApplicationController
  before_action :set_water_fountain, only: [:show, :update, :destroy]

  # No CSRF protection for the API
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate_user_from_token!, except: [:index, :show]

  # GET /water_fountains
  # GET /water_fountains.json
  def index
    @water_fountains = WaterFountain.all.limit(50)
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
    @water_fountain.user = current_user

    # check if image was sent
    if params[:water_fountain] && params[:water_fountain][:image]
      # create a new tempfile named fileupload
      decoded_image_file = Tempfile.new("fileupload")
      decoded_image_file.binmode
      decoded_image_data = Base64.decode64(params[:water_fountain][:image])
      decoded_image_file.write(decoded_image_data)
      # If we don't rewind the file cursor is at the end of the file, and there
      # will be nothing left to read. Giving us the appearance of an empty file.
      decoded_image_file.rewind

      # assert the mime-type is jpeg, if the actual file type doesn't match, the
      # controller will blow up.
      mime_type = 'image/jpeg'

      # Previously we were ascertaining the mimetype from the contents of the
      # file using the ruby-filemagic gem but the FileMagic gem does not
      # install on Heroku. - mjk 2014/5/30
      # mime_type = FileMagic.new(FileMagic::MAGIC_MIME).file(decoded_image_file.path)


      # create a new uploaded file
      uploaded_file = ActionDispatch::Http::UploadedFile.new(
        :tempfile => decoded_image_file,
        :filename => WaterFountain.generate_image_filename,
        :type => mime_type
      )

      @water_fountain.image = uploaded_file
    end

    respond_to do |format|
      if @water_fountain.save
        format.json { render action: 'show', status: :created, location: api_v1_water_fountain_path(@water_fountain) }
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

  def authenticate_user_from_token!
    user_token = params[:public_token].presence
    user       = user_token && User.find_by_public_token(user_token.to_s)
    if user
      sign_in user, store: false
    else
      render json: { error: "You need to sign in or sign up before continuing." }, status: :unauthorized
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_water_fountain
      @water_fountain = WaterFountain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def water_fountain_params
      sanitized_params = params.require(:water_fountain).permit(location: [:type,
                                                                           {coordinates: []}],
                                                                works: nil,
                                                                filling_station: nil,
                                                                dog_bowl: nil,
                                                                flow: nil)
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
