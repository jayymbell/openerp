require "application_system_test_case"

class EmployeeDepartmentsTest < ApplicationSystemTestCase
  setup do
    @employee_department = employee_departments(:one)
  end

  test "visiting the index" do
    visit employee_departments_url
    assert_selector "h1", text: "Employee Departments"
  end

  test "creating a Employee department" do
    visit employee_departments_url
    click_on "New Employee Department"

    fill_in "Department", with: @employee_department.department_id
    fill_in "Employee", with: @employee_department.employee_id
    check "Is active" if @employee_department.is_active
    click_on "Create Employee department"

    assert_text "Employee department was successfully created"
    click_on "Back"
  end

  test "updating a Employee department" do
    visit employee_departments_url
    click_on "Edit", match: :first

    fill_in "Department", with: @employee_department.department_id
    fill_in "Employee", with: @employee_department.employee_id
    check "Is active" if @employee_department.is_active
    click_on "Update Employee department"

    assert_text "Employee department was successfully updated"
    click_on "Back"
  end

  test "destroying a Employee department" do
    visit employee_departments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Employee department was successfully destroyed"
  end
end
