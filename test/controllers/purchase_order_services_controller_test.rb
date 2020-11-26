require 'test_helper'

class PurchaseOrderServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase_order_service = purchase_order_services(:one)
  end

  test "should get index" do
    get purchase_order_services_url
    assert_response :success
  end

  test "should get new" do
    get new_purchase_order_service_url
    assert_response :success
  end

  test "should create purchase_order_service" do
    assert_difference('PurchaseOrderService.count') do
      post purchase_order_services_url, params: { purchase_order_service: { purchase_order_id: @purchase_order_service.purchase_order_id, service_id: @purchase_order_service.service_id, total: @purchase_order_service.total } }
    end

    assert_redirected_to purchase_order_service_url(PurchaseOrderService.last)
  end

  test "should show purchase_order_service" do
    get purchase_order_service_url(@purchase_order_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_purchase_order_service_url(@purchase_order_service)
    assert_response :success
  end

  test "should update purchase_order_service" do
    patch purchase_order_service_url(@purchase_order_service), params: { purchase_order_service: { purchase_order_id: @purchase_order_service.purchase_order_id, service_id: @purchase_order_service.service_id, total: @purchase_order_service.total } }
    assert_redirected_to purchase_order_service_url(@purchase_order_service)
  end

  test "should destroy purchase_order_service" do
    assert_difference('PurchaseOrderService.count', -1) do
      delete purchase_order_service_url(@purchase_order_service)
    end

    assert_redirected_to purchase_order_services_url
  end
end
