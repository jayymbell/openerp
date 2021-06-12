class WorkOrderEffort < ApplicationRecord
  belongs_to :work_order
  belongs_to :employee
end
