class AddDateOfBirthToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :date_of_birth, :datetime
  end
end
