class AddSeriesMasterToSeriesStatement < ActiveRecord::Migration[5.2]
  def change
    add_column :series_statements, :series_master, :boolean
  end
end
