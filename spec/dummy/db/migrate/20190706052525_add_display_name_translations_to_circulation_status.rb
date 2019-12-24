class AddDisplayNameTranslationsToCirculationStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :circulation_statuses, :display_name_translations, :jsonb, default: {}, null: false
  end
end
