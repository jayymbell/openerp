require "application_system_test_case"

class WorkOrderInvoicesTest < ApplicationSystemTestCase
  setup do
    @work_order_invoice = work_order_invoices(:one)
  end

  test "visiting the index" do
    visit work_order_invoices_url
    assert_selector "h1", text: "Work Order Invoices"
  end

  test "creating a Work order invoice" do
    visit work_order_invoices_url
    click_on "New Work Order Invoice"

    fill_in "Allocation", with: @work_order_invoice.allocation
    fill_in "Invoice", with: @work_order_invoice.invoice_id
    fill_in "Work order", with: @work_order_invoice.work_order_id
    click_on "Create Work order invoice"

    assert_text "Work order invoice was successfully created"
    click_on "Back"
  end

  test "updating a Work order invoice" do
    visit work_order_invoices_url
    click_on "Edit", match: :first

    fill_in "Allocation", with: @work_order_invoice.allocation
    fill_in "Invoice", with: @work_order_invoice.invoice_id
    fill_in "Work order", with: @work_order_invoice.work_order_id
    click_on "Update Work order invoice"

    assert_text "Work order invoice was successfully updated"
    click_on "Back"
  end

  test "destroying a Work order invoice" do
    visit work_order_invoices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Work order invoice was successfully destroyed"
  end
end
