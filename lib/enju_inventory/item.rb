module EnjuInventory
  module InventoryItem
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def enju_inventory_item_model
        include InstanceMethods
        has_many :inventories, :dependent => :destroy
        has_many :inventory_files, :through => :inventories
        settings do
          mappings dynamic: 'false', _routing: {required: false} do
            indexes :inventory_file_ids, type: 'integer'
          end
        end

        def inventory_items(inventory_file, mode = 'not_on_shelf')
          item_ids = Item.pluck(:id)
          inventory_item_ids = inventory_file.items.pluck('items.id')
          case mode
          when 'not_on_shelf'
            Item.where(:id => (item_ids - inventory_item_ids))
          when 'not_in_catalog'
            Item.where(:id => (inventory_item_ids - item_ids))
          end
        rescue
          nil
        end
      end
    end

    module ClassMethods
      def as_indexed_json(options={})
        super.merge(
          inventory_file_ids: inventory_file_ids
        )
      end
    end
  end
end
