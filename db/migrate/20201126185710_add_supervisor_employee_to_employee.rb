class AddSupervisorEmployeeToEmployee < ActiveRecord::Migration[6.0]
  def change
    add_reference :employees, :supervisor, foreign_key: { to_table: :employees }
  end
end
