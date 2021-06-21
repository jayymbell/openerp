class WorkOrderEvent < ApplicationRecord
  belongs_to :work_order
  belongs_to :actor, class_name: "User"
end
