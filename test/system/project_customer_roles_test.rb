require "application_system_test_case"

class ProjectCustomerRolesTest < ApplicationSystemTestCase
  setup do
    @project_customer_role = project_customer_roles(:one)
  end

  test "visiting the index" do
    visit project_customer_roles_url
    assert_selector "h1", text: "Project Customer Roles"
  end

  test "creating a Project customer role" do
    visit project_customer_roles_url
    click_on "New Project Customer Role"

    check "Is active" if @project_customer_role.is_active
    fill_in "Project customer", with: @project_customer_role.project_customer_id
    fill_in "Role", with: @project_customer_role.role_id
    click_on "Create Project customer role"

    assert_text "Project customer role was successfully created"
    click_on "Back"
  end

  test "updating a Project customer role" do
    visit project_customer_roles_url
    click_on "Edit", match: :first

    check "Is active" if @project_customer_role.is_active
    fill_in "Project customer", with: @project_customer_role.project_customer_id
    fill_in "Role", with: @project_customer_role.role_id
    click_on "Update Project customer role"

    assert_text "Project customer role was successfully updated"
    click_on "Back"
  end

  test "destroying a Project customer role" do
    visit project_customer_roles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project customer role was successfully destroyed"
  end
end
