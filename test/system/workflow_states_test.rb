require "application_system_test_case"

class WorkflowStatesTest < ApplicationSystemTestCase
  setup do
    @workflow_state = workflow_states(:one)
  end

  test "visiting the index" do
    visit workflow_states_url
    assert_selector "h1", text: "Workflow States"
  end

  test "creating a Workflow state" do
    visit workflow_states_url
    click_on "New Workflow State"

    fill_in "Description", with: @workflow_state.description
    check "Is start" if @workflow_state.is_start
    fill_in "Name", with: @workflow_state.name
    fill_in "Workflow", with: @workflow_state.workflow_id
    click_on "Create Workflow state"

    assert_text "Workflow state was successfully created"
    click_on "Back"
  end

  test "updating a Workflow state" do
    visit workflow_states_url
    click_on "Edit", match: :first

    fill_in "Description", with: @workflow_state.description
    check "Is start" if @workflow_state.is_start
    fill_in "Name", with: @workflow_state.name
    fill_in "Workflow", with: @workflow_state.workflow_id
    click_on "Update Workflow state"

    assert_text "Workflow state was successfully updated"
    click_on "Back"
  end

  test "destroying a Workflow state" do
    visit workflow_states_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Workflow state was successfully destroyed"
  end
end
