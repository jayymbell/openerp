class AddRateToJob < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :rate, :decimal
  end
end
