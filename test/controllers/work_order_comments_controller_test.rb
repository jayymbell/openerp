require 'test_helper'

class WorkOrderCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_order_comment = work_order_comments(:one)
  end

  test "should get index" do
    get work_order_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_work_order_comment_url
    assert_response :success
  end

  test "should create work_order_comment" do
    assert_difference('WorkOrderComment.count') do
      post work_order_comments_url, params: { work_order_comment: { comment: @work_order_comment.comment, user_id: @work_order_comment.user_id, work_order_id: @work_order_comment.work_order_id } }
    end

    assert_redirected_to work_order_comment_url(WorkOrderComment.last)
  end

  test "should show work_order_comment" do
    get work_order_comment_url(@work_order_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_work_order_comment_url(@work_order_comment)
    assert_response :success
  end

  test "should update work_order_comment" do
    patch work_order_comment_url(@work_order_comment), params: { work_order_comment: { comment: @work_order_comment.comment, user_id: @work_order_comment.user_id, work_order_id: @work_order_comment.work_order_id } }
    assert_redirected_to work_order_comment_url(@work_order_comment)
  end

  test "should destroy work_order_comment" do
    assert_difference('WorkOrderComment.count', -1) do
      delete work_order_comment_url(@work_order_comment)
    end

    assert_redirected_to work_order_comments_url
  end
end
