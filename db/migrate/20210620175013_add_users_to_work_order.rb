class AddUsersToWorkOrder < ActiveRecord::Migration[6.0]
  def change
    add_reference :work_orders, :requester, foreign_key: { to_table: :users }
    add_reference :work_orders, :assignee, foreign_key: { to_table: :users }
  end
end
