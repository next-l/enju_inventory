class InventoriesController < ApplicationController
  load_and_authorize_resource
  # GET /inventories
  # GET /inventories.json
  def index
    @inventories = Inventory.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @inventories }
    end
  end

  # GET /inventories/1
  # GET /inventories/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @inventory }
    end
  end

  # GET /inventories/new
  # GET /inventories/new.json
  def new
    @inventory = Inventory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @inventory }
    end
  end

  # GET /inventories/1/edit
  def edit
  end

  # POST /inventories
  # POST /inventories.json
  def create
    @inventory = Inventory.new(params[:inventory])

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to @inventory, notice:  t('controller.successfully_created', model:  t('activerecord.models.inventory')) }
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
      if @inventory.update_attributes(params[:inventory])
        format.html { redirect_to @inventory, notice:  t('controller.successfully_updated', model:  t('activerecord.models.inventory')) }
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
      format.html { redirect_to inventories_url, notice: t('controller.successfully_deleted', model: t('activerecord.models.inventory')) }
      format.json { head :no_content }
    end
  end
end
