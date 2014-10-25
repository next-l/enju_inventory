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
end
