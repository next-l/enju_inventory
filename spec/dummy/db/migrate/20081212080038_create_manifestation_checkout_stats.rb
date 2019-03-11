class CreateManifestationCheckoutStats < ActiveRecord::Migration[5.2]
  def change
    create_table :manifestation_checkout_stats, id: :uuid do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.text :note

      t.timestamps
    end
  end
end
