class WorkOrderPerson < ApplicationRecord
  belongs_to :work_order
  belongs_to :person
end
