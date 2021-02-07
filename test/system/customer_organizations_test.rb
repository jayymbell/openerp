require "application_system_test_case"

class CustomerOrganizationsTest < ApplicationSystemTestCase
  setup do
    @customer_organization = customer_organizations(:one)
  end

  test "visiting the index" do
    visit customer_organizations_url
    assert_selector "h1", text: "Customer Organizations"
  end

  test "creating a Customer organization" do
    visit customer_organizations_url
    click_on "New Customer Organization"

    fill_in "Customer", with: @customer_organization.customer_id
    check "Is active" if @customer_organization.is_active
    fill_in "Organization", with: @customer_organization.organization_id
    click_on "Create Customer organization"

    assert_text "Customer organization was successfully created"
    click_on "Back"
  end

  test "updating a Customer organization" do
    visit customer_organizations_url
    click_on "Edit", match: :first

    fill_in "Customer", with: @customer_organization.customer_id
    check "Is active" if @customer_organization.is_active
    fill_in "Organization", with: @customer_organization.organization_id
    click_on "Update Customer organization"

    assert_text "Customer organization was successfully updated"
    click_on "Back"
  end

  test "destroying a Customer organization" do
    visit customer_organizations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Customer organization was successfully destroyed"
  end
end
