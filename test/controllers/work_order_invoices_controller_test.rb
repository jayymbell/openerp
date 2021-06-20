require 'test_helper'

class WorkOrderInvoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_order_invoice = work_order_invoices(:one)
  end

  test "should get index" do
    get work_order_invoices_url
    assert_response :success
  end

  test "should get new" do
    get new_work_order_invoice_url
    assert_response :success
  end

  test "should create work_order_invoice" do
    assert_difference('WorkOrderInvoice.count') do
      post work_order_invoices_url, params: { work_order_invoice: { allocation: @work_order_invoice.allocation, invoice_id: @work_order_invoice.invoice_id, work_order_id: @work_order_invoice.work_order_id } }
    end

    assert_redirected_to work_order_invoice_url(WorkOrderInvoice.last)
  end

  test "should show work_order_invoice" do
    get work_order_invoice_url(@work_order_invoice)
    assert_response :success
  end

  test "should get edit" do
    get edit_work_order_invoice_url(@work_order_invoice)
    assert_response :success
  end

  test "should update work_order_invoice" do
    patch work_order_invoice_url(@work_order_invoice), params: { work_order_invoice: { allocation: @work_order_invoice.allocation, invoice_id: @work_order_invoice.invoice_id, work_order_id: @work_order_invoice.work_order_id } }
    assert_redirected_to work_order_invoice_url(@work_order_invoice)
  end

  test "should destroy work_order_invoice" do
    assert_difference('WorkOrderInvoice.count', -1) do
      delete work_order_invoice_url(@work_order_invoice)
    end

    assert_redirected_to work_order_invoices_url
  end
end
