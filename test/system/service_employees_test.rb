require "application_system_test_case"

class ServiceEmployeesTest < ApplicationSystemTestCase
  setup do
    @service_employee = service_employees(:one)
  end

  test "visiting the index" do
    visit service_employees_url
    assert_selector "h1", text: "Service Employees"
  end

  test "creating a Service employee" do
    visit service_employees_url
    click_on "New Service Employee"

    fill_in "Employee", with: @service_employee.employee_id
    check "Is active" if @service_employee.is_active
    check "Is primary" if @service_employee.is_primary
    fill_in "Service", with: @service_employee.service_id
    click_on "Create Service employee"

    assert_text "Service employee was successfully created"
    click_on "Back"
  end

  test "updating a Service employee" do
    visit service_employees_url
    click_on "Edit", match: :first

    fill_in "Employee", with: @service_employee.employee_id
    check "Is active" if @service_employee.is_active
    check "Is primary" if @service_employee.is_primary
    fill_in "Service", with: @service_employee.service_id
    click_on "Update Service employee"

    assert_text "Service employee was successfully updated"
    click_on "Back"
  end

  test "destroying a Service employee" do
    visit service_employees_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Service employee was successfully destroyed"
  end
end
