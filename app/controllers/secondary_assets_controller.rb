class SecondaryAssetsController < ApplicationController
  before_action :set_secondary_asset, only: [:show, :edit, :update, :destroy]

  # GET /secondary_assets
  # GET /secondary_assets.json
  def index
    @secondary_assets = SecondaryAsset.all
  end

  # GET /secondary_assets/1
  # GET /secondary_assets/1.json
  def show
  end

  # GET /secondary_assets/new
  def new
    @secondary_asset = SecondaryAsset.new
  end

  # GET /secondary_assets/1/edit
  def edit
  end

  # POST /secondary_assets
  # POST /secondary_assets.json
  def create
    @secondary_asset = SecondaryAsset.new(secondary_asset_params)

    respond_to do |format|
      if @secondary_asset.save
        format.html { redirect_to @secondary_asset, notice: 'Secondary asset was successfully created.' }
        format.json { render :show, status: :created, location: @secondary_asset }
      else
        format.html { render :new }
        format.json { render json: @secondary_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /secondary_assets/1
  # PATCH/PUT /secondary_assets/1.json
  def update
    respond_to do |format|
      if @secondary_asset.update(secondary_asset_params)
        format.html { redirect_to @secondary_asset, notice: 'Secondary asset was successfully updated.' }
        format.json { render :show, status: :ok, location: @secondary_asset }
      else
        format.html { render :edit }
        format.json { render json: @secondary_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /secondary_assets/1
  # DELETE /secondary_assets/1.json
  def destroy
    @secondary_asset.destroy
    respond_to do |format|
      format.html { redirect_to secondary_assets_url, notice: 'Secondary asset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroy_multiple
    params[:id].split(",").each do |id|
      SecondaryAsset.destroy(id)
    end

    respond_to do |format|
      format.json { head :no_content }
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_secondary_asset
      @secondary_asset = SecondaryAsset.find(params[:id])
      @primary_assets = PrimaryAsset.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def secondary_asset_params
      params.require(:secondary_asset).permit(:name, :description, :primary_asset_ids => [])
    end
end
