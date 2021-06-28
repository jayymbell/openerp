class WorkOrder < ApplicationRecord
  belongs_to :project
  belongs_to :workflow_state
  belongs_to :workflow
  belongs_to :requester, class_name: 'User'
  has_many :work_order_efforts, dependent: :destroy
  has_many :work_order_comments, dependent: :destroy
  has_many :work_order_invoices, dependent: :destroy
  has_many :work_order_events, dependent: :destroy

  validates :name, :description, :presence => true

  accepts_nested_attributes_for :work_order_efforts, :allow_destroy => true
  accepts_nested_attributes_for :work_order_comments, :allow_destroy => true
  accepts_nested_attributes_for :work_order_invoices, :allow_destroy => true

  amoeba do
    enable
  end
end
