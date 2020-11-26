class AddBaseRateToService < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :base_rate, :decimal
  end
end
