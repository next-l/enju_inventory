class RenameManifestationPeriodicalToSerial < ActiveRecord::Migration[4.2]
  def up
    rename_column :manifestations, :periodical, :serial
  end

  def down
    rename_column :manifestations, :serial, :periodical
  end
end
