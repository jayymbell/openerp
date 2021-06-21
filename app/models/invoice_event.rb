class InvoiceEvent < ApplicationRecord
  belongs_to :invoice
  belongs_to :actor, class_name: "User"
end
