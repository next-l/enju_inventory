class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  # GET /inventories
  # GET /inventories.json
  def index
    authorize Inventory
    @inventories = Inventory.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @inventories }
    end
  end

  # GET /inventories/1
  # GET /inventories/1.json
  def show
  end

  # GET /inventories/new
  def new
    @inventory = Inventory.new
    authorize @inventory
  end

  # GET /inventories/1/edit
  def edit
  end

  # POST /inventories
  # POST /inventories.json
  def create
    @inventory = Inventory.new(inventory_params)
    authorize @inventory

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to @inventory, notice: t('controller.successfully_created', model: t('activerecord.models.inventory')) }
        format.json { render json: @inventory, status: :created, location: @inventory }
      else
        format.html { render action: "new" }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /inventories/1
  # PUT /inventories/1.json
  def update
    respond_to do |format|
      if @inventory.update_attributes(inventory_params)
        format.html { redirect_to @inventory, notice: t('controller.successfully_updated', model: t('activerecord.models.inventory')) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1
  # DELETE /inventories/1.json
  def destroy
    @inventory.destroy

    respond_to do |format|
      format.html {
        flash[:notice] = t('controller.successfully_deleted', model: t('activerecord.models.inventory'))
        redirect_to inventories_url
      }
      format.json { head :no_content }
    end
  end

  private
  def set_inventory
    @inventory = Inventory.find(params[:id])
    authorize @inventory
  end

  def inventory_params
    params.require(:inventory).permit(:item_id, :inventory_id, :note)
  end
end
