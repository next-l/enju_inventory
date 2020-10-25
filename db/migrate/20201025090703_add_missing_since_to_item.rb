class AddMissingSinceToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :missing_since, :date
  end
end
