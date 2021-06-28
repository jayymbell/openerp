require "test_helper"

class ServiceActionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service_action = service_actions(:one)
  end

  test "should get index" do
    get service_actions_url
    assert_response :success
  end

  test "should get new" do
    get new_service_action_url
    assert_response :success
  end

  test "should create service_action" do
    assert_difference('ServiceAction.count') do
      post service_actions_url, params: { service_action: { description: @service_action.description, name: @service_action.name, service_id: @service_action.service_id, url: @service_action.url } }
    end

    assert_redirected_to service_action_url(ServiceAction.last)
  end

  test "should show service_action" do
    get service_action_url(@service_action)
    assert_response :success
  end

  test "should get edit" do
    get edit_service_action_url(@service_action)
    assert_response :success
  end

  test "should update service_action" do
    patch service_action_url(@service_action), params: { service_action: { description: @service_action.description, name: @service_action.name, service_id: @service_action.service_id, url: @service_action.url } }
    assert_redirected_to service_action_url(@service_action)
  end

  test "should destroy service_action" do
    assert_difference('ServiceAction.count', -1) do
      delete service_action_url(@service_action)
    end

    assert_redirected_to service_actions_url
  end
end
