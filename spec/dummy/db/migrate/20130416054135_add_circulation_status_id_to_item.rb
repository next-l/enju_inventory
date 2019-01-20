class AddCirculationStatusIdToItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :circulation_status, foreign_key: true, default: 5, null: false
    add_reference :items, :checkout_type, foreign_key: true, default: 1, null: false
  end
end
