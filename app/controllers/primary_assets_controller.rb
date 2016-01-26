class PrimaryAssetsController < ApplicationController
  before_action :set_primary_asset, only: [:show, :edit, :update, :destroy]

  # GET /primary_assets
  # GET /primary_assets.json
  def index

    if params[:secondary_asset_id]
      @primary_assets = SecondaryAsset.find_by_id(params[:secondary_asset_id]).primary_assets
    else
      @primary_assets = PrimaryAsset.all
    end

    respond_to do |format| 
      format.html { }
      format.json { render :json => @primary_assets }
    end

  end

  # GET /primary_assets/1
  # GET /primary_assets/1.json
  def show
  end

  # GET /primary_assets/new
  def new
    @primary_asset = PrimaryAsset.new
  end

  # GET /primary_assets/1/edit
  def edit
  end

  # POST /primary_assets
  # POST /primary_assets.json
  def create
    @primary_asset = PrimaryAsset.new(primary_asset_params)

    respond_to do |format|
      if @primary_asset.save
        format.html { redirect_to @primary_asset, notice: 'Primary asset was successfully created.' }
        format.json { render :show, status: :created, location: @primary_asset }
      else
        format.html { render :new }
        format.json { render json: @primary_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /primary_assets/1
  # PATCH/PUT /primary_assets/1.json
  def update
    respond_to do |format|
      if @primary_asset.update(primary_asset_params)
        format.html { 
	  redirect_to @primary_asset, notice: 'Primary asset was successfully updated.' 
	}
        format.json { render :show, status: :ok, location: @primary_asset }
      else
        format.html { 
	  render :edit }
        format.json { render json: @primary_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /primary_assets/1
  # DELETE /primary_assets/1.json
  def destroy
    @primary_asset.destroy
    respond_to do |format|
      format.html { redirect_to primary_assets_url, notice: 'Primary asset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroy_multiple
    params[:id].split(",").each do |id|
      PrimaryAsset.destroy(id)
    end

    respond_to do |format|
   #   format.html { redirect_to primary_assets_url, notice: 'Primary asset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_primary_asset
      @primary_asset = PrimaryAsset.find(params[:id])
      @secondary_assets = SecondaryAsset.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def primary_asset_params
      params.require(:primary_asset).permit(:name, :description, :d, :i, :c, :t, :secondary_asset_ids =>[])
    end
end
