class AddRetainedAtToReserve < ActiveRecord::Migration[5.2]
  def change
    add_column :reserves, :retained_at, :datetime
  end
end
