class AddExpiredAtToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :expired_at, :datetime
  end
end
