require 'test_helper'

class ProjectEmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_employee = project_employees(:one)
  end

  test "should get index" do
    get project_employees_url
    assert_response :success
  end

  test "should get new" do
    get new_project_employee_url
    assert_response :success
  end

  test "should create project_employee" do
    assert_difference('ProjectEmployee.count') do
      post project_employees_url, params: { project_employee: { employee_id: @project_employee.employee_id, is_active: @project_employee.is_active, project_id: @project_employee.project_id } }
    end

    assert_redirected_to project_employee_url(ProjectEmployee.last)
  end

  test "should show project_employee" do
    get project_employee_url(@project_employee)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_employee_url(@project_employee)
    assert_response :success
  end

  test "should update project_employee" do
    patch project_employee_url(@project_employee), params: { project_employee: { employee_id: @project_employee.employee_id, is_active: @project_employee.is_active, project_id: @project_employee.project_id } }
    assert_redirected_to project_employee_url(@project_employee)
  end

  test "should destroy project_employee" do
    assert_difference('ProjectEmployee.count', -1) do
      delete project_employee_url(@project_employee)
    end

    assert_redirected_to project_employees_url
  end
end
