require "application_system_test_case"

class PurchaseOrderEffortsTest < ApplicationSystemTestCase
  setup do
    @purchase_order_effort = purchase_order_efforts(:one)
  end

  test "visiting the index" do
    visit purchase_order_efforts_url
    assert_selector "h1", text: "Purchase Order Efforts"
  end

  test "creating a Purchase order effort" do
    visit purchase_order_efforts_url
    click_on "New Purchase Order Effort"

    fill_in "Employee", with: @purchase_order_effort.employee_id
    fill_in "Purchase order service", with: @purchase_order_effort.purchase_order_service_id
    fill_in "Total", with: @purchase_order_effort.total
    click_on "Create Purchase order effort"

    assert_text "Purchase order effort was successfully created"
    click_on "Back"
  end

  test "updating a Purchase order effort" do
    visit purchase_order_efforts_url
    click_on "Edit", match: :first

    fill_in "Employee", with: @purchase_order_effort.employee_id
    fill_in "Purchase order service", with: @purchase_order_effort.purchase_order_service_id
    fill_in "Total", with: @purchase_order_effort.total
    click_on "Update Purchase order effort"

    assert_text "Purchase order effort was successfully updated"
    click_on "Back"
  end

  test "destroying a Purchase order effort" do
    visit purchase_order_efforts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Purchase order effort was successfully destroyed"
  end
end
