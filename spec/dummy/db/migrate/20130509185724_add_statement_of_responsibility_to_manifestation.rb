class AddStatementOfResponsibilityToManifestation < ActiveRecord::Migration[5.2]
  def change
    add_column :manifestations, :statement_of_responsibility, :text
  end
end
