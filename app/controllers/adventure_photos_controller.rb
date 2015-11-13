class AdventurePhotosController < ApplicationController
  before_action :set_adventure_photo, only: [:show, :edit, :update, :destroy]
  

  # GET /adventure_photos
  # GET /adventure_photos.json
  def index
    @adventure_photos = AdventurePhoto.all
  end

  # GET /adventure_photos/1
  # GET /adventure_photos/1.json
  def show
  end

  # GET /adventure_photos/new
  def new
    @adventure_photo = AdventurePhoto.new
  end

  # GET /adventure_photos/1/edit
  def edit
  end

  # POST /adventure_photos
  # POST /adventure_photos.json
  def create
    @adventure_photo = AdventurePhoto.new(adventure_photo_params)

    respond_to do |format|
      if @adventure_photo.save
        format.html { redirect_to @adventure_photo, notice: 'Adventure photo was successfully created.' }
        format.json { render :show, status: :created, location: @adventure_photo }
      else
        format.html { render :new }
        format.json { render json: @adventure_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adventure_photos/1
  # PATCH/PUT /adventure_photos/1.json
  def update
    respond_to do |format|
      if @adventure_photo.update(adventure_photo_params)
        format.html { redirect_to @adventure_photo, notice: 'Adventure photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @adventure_photo }
      else
        format.html { render :edit }
        format.json { render json: @adventure_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adventure_photos/1
  # DELETE /adventure_photos/1.json
  def destroy
    @adventure_photo.destroy
    respond_to do |format|
      format.html { redirect_to adventure_photos_url, notice: 'Adventure photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adventure_photo
      @adventure_photo = AdventurePhoto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adventure_photo_params
      params.require(:adventure_photo).permit(:adventure_id)
    end
end
