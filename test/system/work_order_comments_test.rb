require "application_system_test_case"

class WorkOrderCommentsTest < ApplicationSystemTestCase
  setup do
    @work_order_comment = work_order_comments(:one)
  end

  test "visiting the index" do
    visit work_order_comments_url
    assert_selector "h1", text: "Work Order Comments"
  end

  test "creating a Work order comment" do
    visit work_order_comments_url
    click_on "New Work Order Comment"

    fill_in "Comment", with: @work_order_comment.comment
    fill_in "User", with: @work_order_comment.user_id
    fill_in "Work order", with: @work_order_comment.work_order_id
    click_on "Create Work order comment"

    assert_text "Work order comment was successfully created"
    click_on "Back"
  end

  test "updating a Work order comment" do
    visit work_order_comments_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @work_order_comment.comment
    fill_in "User", with: @work_order_comment.user_id
    fill_in "Work order", with: @work_order_comment.work_order_id
    click_on "Update Work order comment"

    assert_text "Work order comment was successfully updated"
    click_on "Back"
  end

  test "destroying a Work order comment" do
    visit work_order_comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Work order comment was successfully destroyed"
  end
end
