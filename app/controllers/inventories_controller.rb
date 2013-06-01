class InventoriesController < InheritedResources::Base
  respond_to :html, :json
  load_and_authorize_resource

  def index
    @inventories = Inventory.page(params[:page])
  end
end
