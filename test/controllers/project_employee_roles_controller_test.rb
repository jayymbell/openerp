require 'test_helper'

class ProjectEmployeeRolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_employee_role = project_employee_roles(:one)
  end

  test "should get index" do
    get project_employee_roles_url
    assert_response :success
  end

  test "should get new" do
    get new_project_employee_role_url
    assert_response :success
  end

  test "should create project_employee_role" do
    assert_difference('ProjectEmployeeRole.count') do
      post project_employee_roles_url, params: { project_employee_role: { is_active: @project_employee_role.is_active, project_employee_id: @project_employee_role.project_employee_id, role_id: @project_employee_role.role_id } }
    end

    assert_redirected_to project_employee_role_url(ProjectEmployeeRole.last)
  end

  test "should show project_employee_role" do
    get project_employee_role_url(@project_employee_role)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_employee_role_url(@project_employee_role)
    assert_response :success
  end

  test "should update project_employee_role" do
    patch project_employee_role_url(@project_employee_role), params: { project_employee_role: { is_active: @project_employee_role.is_active, project_employee_id: @project_employee_role.project_employee_id, role_id: @project_employee_role.role_id } }
    assert_redirected_to project_employee_role_url(@project_employee_role)
  end

  test "should destroy project_employee_role" do
    assert_difference('ProjectEmployeeRole.count', -1) do
      delete project_employee_role_url(@project_employee_role)
    end

    assert_redirected_to project_employee_roles_url
  end
end
