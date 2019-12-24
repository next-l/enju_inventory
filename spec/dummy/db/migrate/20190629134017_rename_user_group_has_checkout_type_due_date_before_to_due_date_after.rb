class RenameUserGroupHasCheckoutTypeDueDateBeforeToDueDateAfter < ActiveRecord::Migration[5.2]
  def change
    rename_column :user_group_has_checkout_types, :set_due_date_before_closing_day, :set_due_date_after_closing_day
  end
end
