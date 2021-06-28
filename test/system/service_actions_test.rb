require "application_system_test_case"

class ServiceActionsTest < ApplicationSystemTestCase
  setup do
    @service_action = service_actions(:one)
  end

  test "visiting the index" do
    visit service_actions_url
    assert_selector "h1", text: "Service Actions"
  end

  test "creating a Service action" do
    visit service_actions_url
    click_on "New Service Action"

    fill_in "Description", with: @service_action.description
    fill_in "Name", with: @service_action.name
    fill_in "Service", with: @service_action.service_id
    fill_in "Url", with: @service_action.url
    click_on "Create Service action"

    assert_text "Service action was successfully created"
    click_on "Back"
  end

  test "updating a Service action" do
    visit service_actions_url
    click_on "Edit", match: :first

    fill_in "Description", with: @service_action.description
    fill_in "Name", with: @service_action.name
    fill_in "Service", with: @service_action.service_id
    fill_in "Url", with: @service_action.url
    click_on "Update Service action"

    assert_text "Service action was successfully updated"
    click_on "Back"
  end

  test "destroying a Service action" do
    visit service_actions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Service action was successfully destroyed"
  end
end
