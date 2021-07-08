class DashboardsController < ApplicationController
  def show
    if @current_user.person.employee.present?
      @project = params[:project_id].present? ? Project.find(params[:project_id]) : nil
      @allocations = @current_user.person.employee.project_employees.includes(:project)
      @purchase_orders = PurchaseOrder.joins(:purchase_order_efforts).where(purchase_order_efforts: {employee_id: @current_user.person.employee.id})
      @work_orders = WorkOrder.where(assignee_id: @current_user.id)

      if @project.present?
        @allocations = @allocations.where(project_id: @project.id)
        @purchase_orders = @purchase_orders.where(project_id: @project.id)
        @work_orders = @work_orders.where(project_id: @project.id)
      end
    end
  end
end
