require 'test_helper'

class CustomerOrganizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer_organization = customer_organizations(:one)
  end

  test "should get index" do
    get customer_organizations_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_organization_url
    assert_response :success
  end

  test "should create customer_organization" do
    assert_difference('CustomerOrganization.count') do
      post customer_organizations_url, params: { customer_organization: { customer_id: @customer_organization.customer_id, is_active: @customer_organization.is_active, organization_id: @customer_organization.organization_id } }
    end

    assert_redirected_to customer_organization_url(CustomerOrganization.last)
  end

  test "should show customer_organization" do
    get customer_organization_url(@customer_organization)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_organization_url(@customer_organization)
    assert_response :success
  end

  test "should update customer_organization" do
    patch customer_organization_url(@customer_organization), params: { customer_organization: { customer_id: @customer_organization.customer_id, is_active: @customer_organization.is_active, organization_id: @customer_organization.organization_id } }
    assert_redirected_to customer_organization_url(@customer_organization)
  end

  test "should destroy customer_organization" do
    assert_difference('CustomerOrganization.count', -1) do
      delete customer_organization_url(@customer_organization)
    end

    assert_redirected_to customer_organizations_url
  end
end
