class AdventureImagesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
    @pictures = Pictures.all
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    @pictures = Pictures.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @picture = Picture.new(picture_params)

    respond_to do |format|
     if @picture.save
        format.html { redirect_to @picture, notice: 'Photo was successfully added.' }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @picture.update(photo_params)
        format.html { redirect_to @picture, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @adventure = @picture.adventure
    @picture.destroy
    respond_to do |format|
        format.html { redirect_to '/adventures/' + @adventure.id.to_s + '/edit', notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
        params.require(:picture).permit(:adventure_id, :photo)
    end
end