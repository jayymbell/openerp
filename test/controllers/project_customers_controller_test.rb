require 'test_helper'

class ProjectCustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_customer = project_customers(:one)
  end

  test "should get index" do
    get project_customers_url
    assert_response :success
  end

  test "should get new" do
    get new_project_customer_url
    assert_response :success
  end

  test "should create project_customer" do
    assert_difference('ProjectCustomer.count') do
      post project_customers_url, params: { project_customer: { customer_id: @project_customer.customer_id, is_active: @project_customer.is_active, project_id: @project_customer.project_id } }
    end

    assert_redirected_to project_customer_url(ProjectCustomer.last)
  end

  test "should show project_customer" do
    get project_customer_url(@project_customer)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_customer_url(@project_customer)
    assert_response :success
  end

  test "should update project_customer" do
    patch project_customer_url(@project_customer), params: { project_customer: { customer_id: @project_customer.customer_id, is_active: @project_customer.is_active, project_id: @project_customer.project_id } }
    assert_redirected_to project_customer_url(@project_customer)
  end

  test "should destroy project_customer" do
    assert_difference('ProjectCustomer.count', -1) do
      delete project_customer_url(@project_customer)
    end

    assert_redirected_to project_customers_url
  end
end
