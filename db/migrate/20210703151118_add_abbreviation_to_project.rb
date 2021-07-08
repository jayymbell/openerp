class AddAbbreviationToProject < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :abbreviation, :string
  end
end
