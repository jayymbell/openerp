require 'test_helper'

class ProjectCustomerRolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_customer_role = project_customer_roles(:one)
  end

  test "should get index" do
    get project_customer_roles_url
    assert_response :success
  end

  test "should get new" do
    get new_project_customer_role_url
    assert_response :success
  end

  test "should create project_customer_role" do
    assert_difference('ProjectCustomerRole.count') do
      post project_customer_roles_url, params: { project_customer_role: { is_active: @project_customer_role.is_active, project_customer_id: @project_customer_role.project_customer_id, role_id: @project_customer_role.role_id } }
    end

    assert_redirected_to project_customer_role_url(ProjectCustomerRole.last)
  end

  test "should show project_customer_role" do
    get project_customer_role_url(@project_customer_role)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_customer_role_url(@project_customer_role)
    assert_response :success
  end

  test "should update project_customer_role" do
    patch project_customer_role_url(@project_customer_role), params: { project_customer_role: { is_active: @project_customer_role.is_active, project_customer_id: @project_customer_role.project_customer_id, role_id: @project_customer_role.role_id } }
    assert_redirected_to project_customer_role_url(@project_customer_role)
  end

  test "should destroy project_customer_role" do
    assert_difference('ProjectCustomerRole.count', -1) do
      delete project_customer_role_url(@project_customer_role)
    end

    assert_redirected_to project_customer_roles_url
  end
end
