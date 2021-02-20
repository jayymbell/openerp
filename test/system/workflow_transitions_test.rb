require "application_system_test_case"

class WorkflowTransitionsTest < ApplicationSystemTestCase
  setup do
    @workflow_transition = workflow_transitions(:one)
  end

  test "visiting the index" do
    visit workflow_transitions_url
    assert_selector "h1", text: "Workflow Transitions"
  end

  test "creating a Workflow transition" do
    visit workflow_transitions_url
    click_on "New Workflow Transition"

    fill_in "Description", with: @workflow_transition.description
    fill_in "Name", with: @workflow_transition.name
    fill_in "Source state", with: @workflow_transition.source_state_id
    fill_in "Target state", with: @workflow_transition.target_state_id
    fill_in "Workflow", with: @workflow_transition.workflow_id
    click_on "Create Workflow transition"

    assert_text "Workflow transition was successfully created"
    click_on "Back"
  end

  test "updating a Workflow transition" do
    visit workflow_transitions_url
    click_on "Edit", match: :first

    fill_in "Description", with: @workflow_transition.description
    fill_in "Name", with: @workflow_transition.name
    fill_in "Source state", with: @workflow_transition.source_state_id
    fill_in "Target state", with: @workflow_transition.target_state_id
    fill_in "Workflow", with: @workflow_transition.workflow_id
    click_on "Update Workflow transition"

    assert_text "Workflow transition was successfully updated"
    click_on "Back"
  end

  test "destroying a Workflow transition" do
    visit workflow_transitions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Workflow transition was successfully destroyed"
  end
end
