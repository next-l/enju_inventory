class CreateReserveStatHasManifestations < ActiveRecord::Migration[5.2]
  def change
    create_table :reserve_stat_has_manifestations do |t|
      t.references :manifestation_reserve_stat, index: false, null: false
      t.references :manifestation, index: false, foreign_key: true, null: false
      t.integer :reserves_count

      t.timestamps
    end
    add_index :reserve_stat_has_manifestations, :manifestation_reserve_stat_id, name: 'index_reserve_stat_has_manifestations_on_m_reserve_stat_id'
    add_index :reserve_stat_has_manifestations, :manifestation_id
  end
end
