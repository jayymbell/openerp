class ProductAssemblyComponent < ApplicationRecord
  belongs_to :product_assembly
  belongs_to :component
end
