require 'test_helper'

class ProductAssemblyComponentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_assembly_component = product_assembly_components(:one)
  end

  test "should get index" do
    get product_assembly_components_url
    assert_response :success
  end

  test "should get new" do
    get new_product_assembly_component_url
    assert_response :success
  end

  test "should create product_assembly_component" do
    assert_difference('ProductAssemblyComponent.count') do
      post product_assembly_components_url, params: { product_assembly_component: { component_id: @product_assembly_component.component_id, cost: @product_assembly_component.cost, margin: @product_assembly_component.margin, product_assembly_id: @product_assembly_component.product_assembly_id, quantity: @product_assembly_component.quantity } }
    end

    assert_redirected_to product_assembly_component_url(ProductAssemblyComponent.last)
  end

  test "should show product_assembly_component" do
    get product_assembly_component_url(@product_assembly_component)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_assembly_component_url(@product_assembly_component)
    assert_response :success
  end

  test "should update product_assembly_component" do
    patch product_assembly_component_url(@product_assembly_component), params: { product_assembly_component: { component_id: @product_assembly_component.component_id, cost: @product_assembly_component.cost, margin: @product_assembly_component.margin, product_assembly_id: @product_assembly_component.product_assembly_id, quantity: @product_assembly_component.quantity } }
    assert_redirected_to product_assembly_component_url(@product_assembly_component)
  end

  test "should destroy product_assembly_component" do
    assert_difference('ProductAssemblyComponent.count', -1) do
      delete product_assembly_component_url(@product_assembly_component)
    end

    assert_redirected_to product_assembly_components_url
  end
end
