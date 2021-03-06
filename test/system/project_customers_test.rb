require "application_system_test_case"

class ProjectCustomersTest < ApplicationSystemTestCase
  setup do
    @project_customer = project_customers(:one)
  end

  test "visiting the index" do
    visit project_customers_url
    assert_selector "h1", text: "Project Customers"
  end

  test "creating a Project customer" do
    visit project_customers_url
    click_on "New Project Customer"

    fill_in "Customer", with: @project_customer.customer_id
    check "Is active" if @project_customer.is_active
    fill_in "Project", with: @project_customer.project_id
    click_on "Create Project customer"

    assert_text "Project customer was successfully created"
    click_on "Back"
  end

  test "updating a Project customer" do
    visit project_customers_url
    click_on "Edit", match: :first

    fill_in "Customer", with: @project_customer.customer_id
    check "Is active" if @project_customer.is_active
    fill_in "Project", with: @project_customer.project_id
    click_on "Update Project customer"

    assert_text "Project customer was successfully updated"
    click_on "Back"
  end

  test "destroying a Project customer" do
    visit project_customers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project customer was successfully destroyed"
  end
end
