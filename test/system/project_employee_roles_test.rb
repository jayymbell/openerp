require "application_system_test_case"

class ProjectEmployeeRolesTest < ApplicationSystemTestCase
  setup do
    @project_employee_role = project_employee_roles(:one)
  end

  test "visiting the index" do
    visit project_employee_roles_url
    assert_selector "h1", text: "Project Employee Roles"
  end

  test "creating a Project employee role" do
    visit project_employee_roles_url
    click_on "New Project Employee Role"

    check "Is active" if @project_employee_role.is_active
    fill_in "Project employee", with: @project_employee_role.project_employee_id
    fill_in "Role", with: @project_employee_role.role_id
    click_on "Create Project employee role"

    assert_text "Project employee role was successfully created"
    click_on "Back"
  end

  test "updating a Project employee role" do
    visit project_employee_roles_url
    click_on "Edit", match: :first

    check "Is active" if @project_employee_role.is_active
    fill_in "Project employee", with: @project_employee_role.project_employee_id
    fill_in "Role", with: @project_employee_role.role_id
    click_on "Update Project employee role"

    assert_text "Project employee role was successfully updated"
    click_on "Back"
  end

  test "destroying a Project employee role" do
    visit project_employee_roles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project employee role was successfully destroyed"
  end
end
