require 'test_helper'

class EmployeeDepartmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee_department = employee_departments(:one)
  end

  test "should get index" do
    get employee_departments_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_department_url
    assert_response :success
  end

  test "should create employee_department" do
    assert_difference('EmployeeDepartment.count') do
      post employee_departments_url, params: { employee_department: { department_id: @employee_department.department_id, employee_id: @employee_department.employee_id, is_active: @employee_department.is_active } }
    end

    assert_redirected_to employee_department_url(EmployeeDepartment.last)
  end

  test "should show employee_department" do
    get employee_department_url(@employee_department)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_department_url(@employee_department)
    assert_response :success
  end

  test "should update employee_department" do
    patch employee_department_url(@employee_department), params: { employee_department: { department_id: @employee_department.department_id, employee_id: @employee_department.employee_id, is_active: @employee_department.is_active } }
    assert_redirected_to employee_department_url(@employee_department)
  end

  test "should destroy employee_department" do
    assert_difference('EmployeeDepartment.count', -1) do
      delete employee_department_url(@employee_department)
    end

    assert_redirected_to employee_departments_url
  end
end
