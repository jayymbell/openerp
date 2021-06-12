class WorkOrderComment < ApplicationRecord
  belongs_to :user
  belongs_to :work_order
end
