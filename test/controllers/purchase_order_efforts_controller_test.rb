require 'test_helper'

class PurchaseOrderEffortsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase_order_effort = purchase_order_efforts(:one)
  end

  test "should get index" do
    get purchase_order_efforts_url
    assert_response :success
  end

  test "should get new" do
    get new_purchase_order_effort_url
    assert_response :success
  end

  test "should create purchase_order_effort" do
    assert_difference('PurchaseOrderEffort.count') do
      post purchase_order_efforts_url, params: { purchase_order_effort: { employee_id: @purchase_order_effort.employee_id, purchase_order_service_id: @purchase_order_effort.purchase_order_service_id, total: @purchase_order_effort.total } }
    end

    assert_redirected_to purchase_order_effort_url(PurchaseOrderEffort.last)
  end

  test "should show purchase_order_effort" do
    get purchase_order_effort_url(@purchase_order_effort)
    assert_response :success
  end

  test "should get edit" do
    get edit_purchase_order_effort_url(@purchase_order_effort)
    assert_response :success
  end

  test "should update purchase_order_effort" do
    patch purchase_order_effort_url(@purchase_order_effort), params: { purchase_order_effort: { employee_id: @purchase_order_effort.employee_id, purchase_order_service_id: @purchase_order_effort.purchase_order_service_id, total: @purchase_order_effort.total } }
    assert_redirected_to purchase_order_effort_url(@purchase_order_effort)
  end

  test "should destroy purchase_order_effort" do
    assert_difference('PurchaseOrderEffort.count', -1) do
      delete purchase_order_effort_url(@purchase_order_effort)
    end

    assert_redirected_to purchase_order_efforts_url
  end
end
