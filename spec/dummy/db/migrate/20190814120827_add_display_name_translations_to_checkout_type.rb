class AddDisplayNameTranslationsToCheckoutType < ActiveRecord::Migration[5.2]
  def change
    add_column :checkout_types, :display_name_translations, :jsonb, default: {}, null: false
  end
end
