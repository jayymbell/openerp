class PurchaseOrderProductAssembly < ApplicationRecord
  belongs_to :purchase_order
  belongs_to :product_assembly
end
