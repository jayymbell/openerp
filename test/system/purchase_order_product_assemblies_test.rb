require "application_system_test_case"

class PurchaseOrderProductAssembliesTest < ApplicationSystemTestCase
  setup do
    @purchase_order_product_assembly = purchase_order_product_assemblies(:one)
  end

  test "visiting the index" do
    visit purchase_order_product_assemblies_url
    assert_selector "h1", text: "Purchase Order Product Assemblies"
  end

  test "creating a Purchase order product assembly" do
    visit purchase_order_product_assemblies_url
    click_on "New Purchase Order Product Assembly"

    fill_in "Product assembly", with: @purchase_order_product_assembly.product_assembly_id
    fill_in "Purchase order", with: @purchase_order_product_assembly.purchase_order_id
    fill_in "Quantity", with: @purchase_order_product_assembly.quantity
    fill_in "Total", with: @purchase_order_product_assembly.total
    click_on "Create Purchase order product assembly"

    assert_text "Purchase order product assembly was successfully created"
    click_on "Back"
  end

  test "updating a Purchase order product assembly" do
    visit purchase_order_product_assemblies_url
    click_on "Edit", match: :first

    fill_in "Product assembly", with: @purchase_order_product_assembly.product_assembly_id
    fill_in "Purchase order", with: @purchase_order_product_assembly.purchase_order_id
    fill_in "Quantity", with: @purchase_order_product_assembly.quantity
    fill_in "Total", with: @purchase_order_product_assembly.total
    click_on "Update Purchase order product assembly"

    assert_text "Purchase order product assembly was successfully updated"
    click_on "Back"
  end

  test "destroying a Purchase order product assembly" do
    visit purchase_order_product_assemblies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Purchase order product assembly was successfully destroyed"
  end
end
