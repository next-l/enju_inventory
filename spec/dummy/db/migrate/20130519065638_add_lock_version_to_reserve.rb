class AddLockVersionToReserve < ActiveRecord::Migration[5.1]
  def change
    add_column :reserves, :lock_version, :integer, default: 0, null: false
  end
end
