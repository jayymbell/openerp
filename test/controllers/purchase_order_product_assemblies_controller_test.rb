require 'test_helper'

class PurchaseOrderProductAssembliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase_order_product_assembly = purchase_order_product_assemblies(:one)
  end

  test "should get index" do
    get purchase_order_product_assemblies_url
    assert_response :success
  end

  test "should get new" do
    get new_purchase_order_product_assembly_url
    assert_response :success
  end

  test "should create purchase_order_product_assembly" do
    assert_difference('PurchaseOrderProductAssembly.count') do
      post purchase_order_product_assemblies_url, params: { purchase_order_product_assembly: { product_assembly_id: @purchase_order_product_assembly.product_assembly_id, purchase_order_id: @purchase_order_product_assembly.purchase_order_id, quantity: @purchase_order_product_assembly.quantity, total: @purchase_order_product_assembly.total } }
    end

    assert_redirected_to purchase_order_product_assembly_url(PurchaseOrderProductAssembly.last)
  end

  test "should show purchase_order_product_assembly" do
    get purchase_order_product_assembly_url(@purchase_order_product_assembly)
    assert_response :success
  end

  test "should get edit" do
    get edit_purchase_order_product_assembly_url(@purchase_order_product_assembly)
    assert_response :success
  end

  test "should update purchase_order_product_assembly" do
    patch purchase_order_product_assembly_url(@purchase_order_product_assembly), params: { purchase_order_product_assembly: { product_assembly_id: @purchase_order_product_assembly.product_assembly_id, purchase_order_id: @purchase_order_product_assembly.purchase_order_id, quantity: @purchase_order_product_assembly.quantity, total: @purchase_order_product_assembly.total } }
    assert_redirected_to purchase_order_product_assembly_url(@purchase_order_product_assembly)
  end

  test "should destroy purchase_order_product_assembly" do
    assert_difference('PurchaseOrderProductAssembly.count', -1) do
      delete purchase_order_product_assembly_url(@purchase_order_product_assembly)
    end

    assert_redirected_to purchase_order_product_assemblies_url
  end
end
