require "application_system_test_case"

class PurchaseOrderServicesTest < ApplicationSystemTestCase
  setup do
    @purchase_order_service = purchase_order_services(:one)
  end

  test "visiting the index" do
    visit purchase_order_services_url
    assert_selector "h1", text: "Purchase Order Services"
  end

  test "creating a Purchase order service" do
    visit purchase_order_services_url
    click_on "New Purchase Order Service"

    fill_in "Purchase order", with: @purchase_order_service.purchase_order_id
    fill_in "Service", with: @purchase_order_service.service_id
    fill_in "Total", with: @purchase_order_service.total
    click_on "Create Purchase order service"

    assert_text "Purchase order service was successfully created"
    click_on "Back"
  end

  test "updating a Purchase order service" do
    visit purchase_order_services_url
    click_on "Edit", match: :first

    fill_in "Purchase order", with: @purchase_order_service.purchase_order_id
    fill_in "Service", with: @purchase_order_service.service_id
    fill_in "Total", with: @purchase_order_service.total
    click_on "Update Purchase order service"

    assert_text "Purchase order service was successfully updated"
    click_on "Back"
  end

  test "destroying a Purchase order service" do
    visit purchase_order_services_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Purchase order service was successfully destroyed"
  end
end
