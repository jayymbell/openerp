require "application_system_test_case"

class ProjectEmployeesTest < ApplicationSystemTestCase
  setup do
    @project_employee = project_employees(:one)
  end

  test "visiting the index" do
    visit project_employees_url
    assert_selector "h1", text: "Project Employees"
  end

  test "creating a Project employee" do
    visit project_employees_url
    click_on "New Project Employee"

    fill_in "Employee", with: @project_employee.employee_id
    check "Is active" if @project_employee.is_active
    fill_in "Project", with: @project_employee.project_id
    click_on "Create Project employee"

    assert_text "Project employee was successfully created"
    click_on "Back"
  end

  test "updating a Project employee" do
    visit project_employees_url
    click_on "Edit", match: :first

    fill_in "Employee", with: @project_employee.employee_id
    check "Is active" if @project_employee.is_active
    fill_in "Project", with: @project_employee.project_id
    click_on "Update Project employee"

    assert_text "Project employee was successfully updated"
    click_on "Back"
  end

  test "destroying a Project employee" do
    visit project_employees_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project employee was successfully destroyed"
  end
end
