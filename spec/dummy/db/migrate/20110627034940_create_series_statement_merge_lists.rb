class CreateSeriesStatementMergeLists < ActiveRecord::Migration[5.2]
  def change
    create_table :series_statement_merge_lists do |t|
      t.string :title

      t.timestamps
    end
  end
end
