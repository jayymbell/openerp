require "application_system_test_case"

class WorkOrderEffortsTest < ApplicationSystemTestCase
  setup do
    @work_order_effort = work_order_efforts(:one)
  end

  test "visiting the index" do
    visit work_order_efforts_url
    assert_selector "h1", text: "Work Order Efforts"
  end

  test "creating a Work order effort" do
    visit work_order_efforts_url
    click_on "New Work Order Effort"

    fill_in "Employee", with: @work_order_effort.employee_id
    fill_in "Hours", with: @work_order_effort.hours
    fill_in "Long description", with: @work_order_effort.long_description
    fill_in "Short description", with: @work_order_effort.short_description
    fill_in "Work order", with: @work_order_effort.work_order_id
    click_on "Create Work order effort"

    assert_text "Work order effort was successfully created"
    click_on "Back"
  end

  test "updating a Work order effort" do
    visit work_order_efforts_url
    click_on "Edit", match: :first

    fill_in "Employee", with: @work_order_effort.employee_id
    fill_in "Hours", with: @work_order_effort.hours
    fill_in "Long description", with: @work_order_effort.long_description
    fill_in "Short description", with: @work_order_effort.short_description
    fill_in "Work order", with: @work_order_effort.work_order_id
    click_on "Update Work order effort"

    assert_text "Work order effort was successfully updated"
    click_on "Back"
  end

  test "destroying a Work order effort" do
    visit work_order_efforts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Work order effort was successfully destroyed"
  end
end
