class InventoriesController < InheritedResources::Base
  respond_to :html, :xml
  load_and_authorize_resource

  def index
    @inventories = @inventories.page(params[:page])
  end
end
