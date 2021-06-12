class WorkOrder < ApplicationRecord
  belongs_to :project
  has_many :work_order_efforts, dependent: :destroy

  validates :name, :description, :presence => true

  accepts_nested_attributes_for :work_order_efforts, :allow_destroy => true

  amoeba do
    enable
  end
end
