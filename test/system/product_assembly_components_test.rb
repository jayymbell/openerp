require "application_system_test_case"

class ProductAssemblyComponentsTest < ApplicationSystemTestCase
  setup do
    @product_assembly_component = product_assembly_components(:one)
  end

  test "visiting the index" do
    visit product_assembly_components_url
    assert_selector "h1", text: "Product Assembly Components"
  end

  test "creating a Product assembly component" do
    visit product_assembly_components_url
    click_on "New Product Assembly Component"

    fill_in "Component", with: @product_assembly_component.component_id
    fill_in "Cost", with: @product_assembly_component.cost
    fill_in "Margin", with: @product_assembly_component.margin
    fill_in "Product assembly", with: @product_assembly_component.product_assembly_id
    fill_in "Quantity", with: @product_assembly_component.quantity
    click_on "Create Product assembly component"

    assert_text "Product assembly component was successfully created"
    click_on "Back"
  end

  test "updating a Product assembly component" do
    visit product_assembly_components_url
    click_on "Edit", match: :first

    fill_in "Component", with: @product_assembly_component.component_id
    fill_in "Cost", with: @product_assembly_component.cost
    fill_in "Margin", with: @product_assembly_component.margin
    fill_in "Product assembly", with: @product_assembly_component.product_assembly_id
    fill_in "Quantity", with: @product_assembly_component.quantity
    click_on "Update Product assembly component"

    assert_text "Product assembly component was successfully updated"
    click_on "Back"
  end

  test "destroying a Product assembly component" do
    visit product_assembly_components_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product assembly component was successfully destroyed"
  end
end
