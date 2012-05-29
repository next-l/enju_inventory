require "enju_inventory/engine"

module EnjuInventory
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def enju_inventory
      include EnjuInventory::InstanceMethods
    end
  end

  module InstanceMethods
    def get_inventory_file
      @inventory_file = InventoryFile.find(params[:inventory_file_id]) if params[:inventory_file_id]
    end
  end
end

ActionController::Base.send(:include, EnjuInventory)
