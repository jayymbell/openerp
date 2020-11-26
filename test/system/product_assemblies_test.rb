require "application_system_test_case"

class ProductAssembliesTest < ApplicationSystemTestCase
  setup do
    @product_assembly = product_assemblies(:one)
  end

  test "visiting the index" do
    visit product_assemblies_url
    assert_selector "h1", text: "Product Assemblies"
  end

  test "creating a Product assembly" do
    visit product_assemblies_url
    click_on "New Product Assembly"

    fill_in "Description", with: @product_assembly.description
    check "Is active" if @product_assembly.is_active
    fill_in "Name", with: @product_assembly.name
    fill_in "Product", with: @product_assembly.product_id
    click_on "Create Product assembly"

    assert_text "Product assembly was successfully created"
    click_on "Back"
  end

  test "updating a Product assembly" do
    visit product_assemblies_url
    click_on "Edit", match: :first

    fill_in "Description", with: @product_assembly.description
    check "Is active" if @product_assembly.is_active
    fill_in "Name", with: @product_assembly.name
    fill_in "Product", with: @product_assembly.product_id
    click_on "Update Product assembly"

    assert_text "Product assembly was successfully updated"
    click_on "Back"
  end

  test "destroying a Product assembly" do
    visit product_assemblies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product assembly was successfully destroyed"
  end
end
