require 'test_helper'

class ServiceEmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service_employee = service_employees(:one)
  end

  test "should get index" do
    get service_employees_url
    assert_response :success
  end

  test "should get new" do
    get new_service_employee_url
    assert_response :success
  end

  test "should create service_employee" do
    assert_difference('ServiceEmployee.count') do
      post service_employees_url, params: { service_employee: { employee_id: @service_employee.employee_id, is_active: @service_employee.is_active, is_primary: @service_employee.is_primary, service_id: @service_employee.service_id } }
    end

    assert_redirected_to service_employee_url(ServiceEmployee.last)
  end

  test "should show service_employee" do
    get service_employee_url(@service_employee)
    assert_response :success
  end

  test "should get edit" do
    get edit_service_employee_url(@service_employee)
    assert_response :success
  end

  test "should update service_employee" do
    patch service_employee_url(@service_employee), params: { service_employee: { employee_id: @service_employee.employee_id, is_active: @service_employee.is_active, is_primary: @service_employee.is_primary, service_id: @service_employee.service_id } }
    assert_redirected_to service_employee_url(@service_employee)
  end

  test "should destroy service_employee" do
    assert_difference('ServiceEmployee.count', -1) do
      delete service_employee_url(@service_employee)
    end

    assert_redirected_to service_employees_url
  end
end
