class RemoveExpireDateFromReserve < ActiveRecord::Migration[4.2]
  def self.up
    remove_column :reserves, :expire_date
  end

  def self.down
    add_column :reserves, :expire_date, :string
  end
end
