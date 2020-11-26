require "application_system_test_case"

class InvoiceLinesTest < ApplicationSystemTestCase
  setup do
    @invoice_line = invoice_lines(:one)
  end

  test "visiting the index" do
    visit invoice_lines_url
    assert_selector "h1", text: "Invoice Lines"
  end

  test "creating a Invoice line" do
    visit invoice_lines_url
    click_on "New Invoice Line"

    fill_in "Invoice", with: @invoice_line.invoice_id
    check "Is invoiceable" if @invoice_line.is_invoiceable
    fill_in "Long description", with: @invoice_line.long_description
    fill_in "Short description", with: @invoice_line.short_description
    fill_in "Total", with: @invoice_line.total
    click_on "Create Invoice line"

    assert_text "Invoice line was successfully created"
    click_on "Back"
  end

  test "updating a Invoice line" do
    visit invoice_lines_url
    click_on "Edit", match: :first

    fill_in "Invoice", with: @invoice_line.invoice_id
    check "Is invoiceable" if @invoice_line.is_invoiceable
    fill_in "Long description", with: @invoice_line.long_description
    fill_in "Short description", with: @invoice_line.short_description
    fill_in "Total", with: @invoice_line.total
    click_on "Update Invoice line"

    assert_text "Invoice line was successfully updated"
    click_on "Back"
  end

  test "destroying a Invoice line" do
    visit invoice_lines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Invoice line was successfully destroyed"
  end
end
