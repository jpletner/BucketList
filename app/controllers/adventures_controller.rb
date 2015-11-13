class AdventuresController < ApplicationController
  before_action :set_adventure, only: [:show, :edit, :update, :destroy, :adventure_photo]
  # before_action :set_adventure_photos, only: [:add_adventure_photos]
  # GET /adventures
  # GET /adventures.json
  def index
    @adventures = Adventure.all
  end

  # GET /adventures/1
  # GET /adventures/1.json
  def show
  end

  # GET /adventures/new
  def new
    @adventure = Adventure.new
  end

  # GET /adventures/1/edit
  def edit
  end

  # POST /adventures
  # POST /adventures.json
  def create
    @adventure = Adventure.new(adventure_params)

    respond_to do |format|
      if @adventure.save
        @adventure_photos = multiple_photos(@adventure)
        @adventure.adventure_photos = params[:images]
        format.html { redirect_to @adventure, notice: 'Adventure was successfully created.' }
        format.json { render :show, status: :created, location: @adventure }
      else
        format.html { render :new }
        format.json { render json: @adventure.errors, status: :unprocessable_entity }
      end
    end
  end

  def multiple_photos(adventure)
    if !params[:image].nil?
      1/0
      params[:image].each do |j|
        adventures.adventure_photos.create(image: j)
      end
    end
    adventure
  end


  # def add_adventure_photos
  #   @adventure = Adventure.find(params[:id])
  #   @adventure_photos = AdventurePhoto.new
  #   @adventure_photos =
  #   # newAdventurePhoto = AdventurePhoto.new(params[:adventure])
  #
  #
  #   render 'show.html.erb'
  # end

  # PATCH/PUT /adventures/1
  # PATCH/PUT /adventures/1.json
  def update
    set_adventure
    multiple_photos(@adventure)
    render 'show.html.erb'

    # respond_to do |format|
    #   if @adventure.update(adventure_params)
    #     @adventure_photos = multiple_photos(@adventure)
    #     @adventure.adventure_photos = params[:images]
    #
    #     format.html { redirect_to users_show_url, notice: 'Adventure was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @adventure }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @adventure.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /adventures/1
  # DELETE /adventures/1.json
  def destroy
    @adventure.destroy
    respond_to do |format|
      format.html { redirect_to users_show_url, notice: 'Adventure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def profile_home
  end

  def search_adventures
   if !params[:adventure_title].nil?
     search_string = params[:adventure_title]
     @adventures = Adventure.basic_search(title: search_string)
   end
  end

  def add_comment
    @adventure = Adventure.find(params[:id])
    comment = params[:comment]
    if !comment.nil?
      @adventure.comments << comment
      @adventure.save
    end
    render "show.html.erb"
  end

  def add_tag
    @adventure = Adventure.find(params[:id])
    tag = params[:tag]
    if !tag.nil?
      @adventure.tags << tag
      @adventure.save
    end
    render "show.html.erb"
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adventure
      @adventure = Adventure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adventure_params
      params.require(:adventure).permit(:title, :description, :duedate, :creator, :priority, :completed, :comments, :image, :tags, :adventure)

    end

    def set_adventure_photos
      @adventurePhoto = AdventurePhoto.new

    end

end
