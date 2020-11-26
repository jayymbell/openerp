require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    visit users_url
    click_on "New User"

    fill_in "Activation at", with: @user.activation_at
    fill_in "Activation digest", with: @user.activation_digest
    fill_in "Activation sent at", with: @user.activation_sent_at
    check "Is active" if @user.is_active
    fill_in "Password digest", with: @user.password_digest
    fill_in "Person", with: @user.person_id
    fill_in "Reset at", with: @user.reset_at
    fill_in "Reset digest", with: @user.reset_digest
    fill_in "Reset sent at", with: @user.reset_sent_at
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first

    fill_in "Activation at", with: @user.activation_at
    fill_in "Activation digest", with: @user.activation_digest
    fill_in "Activation sent at", with: @user.activation_sent_at
    check "Is active" if @user.is_active
    fill_in "Password digest", with: @user.password_digest
    fill_in "Person", with: @user.person_id
    fill_in "Reset at", with: @user.reset_at
    fill_in "Reset digest", with: @user.reset_digest
    fill_in "Reset sent at", with: @user.reset_sent_at
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
