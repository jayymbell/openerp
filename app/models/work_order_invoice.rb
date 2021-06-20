class WorkOrderInvoice < ApplicationRecord
  belongs_to :work_order
  belongs_to :invoice
end
