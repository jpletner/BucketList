class MigrationsController < ApplicationController
  before_action :set_migration, only: [:show, :edit, :update, :destroy]

  # GET /migrations
  # GET /migrations.json
  def index
    @migrations = Migration.all
  end

  # GET /migrations/1
  # GET /migrations/1.json
  def show
  end

  # GET /migrations/new
  def new
    @migration = Migration.new
  end

  # GET /migrations/1/edit
  def edit
  end

  # POST /migrations
  # POST /migrations.json
  def create
    @migration = Migration.new(migration_params)

    respond_to do |format|
      if @migration.save
        format.html { redirect_to @migration, notice: 'Migration was successfully created.' }
        format.json { render :show, status: :created, location: @migration }
      else
        format.html { render :new }
        format.json { render json: @migration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /migrations/1
  # PATCH/PUT /migrations/1.json
  def update
    respond_to do |format|
      if @migration.update(migration_params)
        format.html { redirect_to @migration, notice: 'Migration was successfully updated.' }
        format.json { render :show, status: :ok, location: @migration }
      else
        format.html { render :edit }
        format.json { render json: @migration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /migrations/1
  # DELETE /migrations/1.json
  def destroy
    @migration.destroy
    respond_to do |format|
      format.html { redirect_to migrations_url, notice: 'Migration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_migration
      @migration = Migration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def migration_params
      params.require(:migration).permit(:addPaperclipToPictures)
    end
end
