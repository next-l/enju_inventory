class AddCurrentCheckoutCountToUserGroupHasCheckoutType < ActiveRecord::Migration[5.1]
  def self.up
    add_column :user_group_has_checkout_types, :current_checkout_count, :integer
  end

  def self.down
    remove_column :user_group_has_checkout_types, :current_checkout_count
  end
end
