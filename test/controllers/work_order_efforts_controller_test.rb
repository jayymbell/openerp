require 'test_helper'

class WorkOrderEffortsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_order_effort = work_order_efforts(:one)
  end

  test "should get index" do
    get work_order_efforts_url
    assert_response :success
  end

  test "should get new" do
    get new_work_order_effort_url
    assert_response :success
  end

  test "should create work_order_effort" do
    assert_difference('WorkOrderEffort.count') do
      post work_order_efforts_url, params: { work_order_effort: { employee_id: @work_order_effort.employee_id, hours: @work_order_effort.hours, long_description: @work_order_effort.long_description, short_description: @work_order_effort.short_description, work_order_id: @work_order_effort.work_order_id } }
    end

    assert_redirected_to work_order_effort_url(WorkOrderEffort.last)
  end

  test "should show work_order_effort" do
    get work_order_effort_url(@work_order_effort)
    assert_response :success
  end

  test "should get edit" do
    get edit_work_order_effort_url(@work_order_effort)
    assert_response :success
  end

  test "should update work_order_effort" do
    patch work_order_effort_url(@work_order_effort), params: { work_order_effort: { employee_id: @work_order_effort.employee_id, hours: @work_order_effort.hours, long_description: @work_order_effort.long_description, short_description: @work_order_effort.short_description, work_order_id: @work_order_effort.work_order_id } }
    assert_redirected_to work_order_effort_url(@work_order_effort)
  end

  test "should destroy work_order_effort" do
    assert_difference('WorkOrderEffort.count', -1) do
      delete work_order_effort_url(@work_order_effort)
    end

    assert_redirected_to work_order_efforts_url
  end
end
