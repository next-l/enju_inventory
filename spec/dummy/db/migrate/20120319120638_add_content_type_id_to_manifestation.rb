class AddContentTypeIdToManifestation < ActiveRecord::Migration[5.2]
  def change
    add_column :manifestations, :content_type_id, :integer, default: 1

  end
end
