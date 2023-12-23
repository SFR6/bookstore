require "application_system_test_case"

class PaymentmethodsTest < ApplicationSystemTestCase
  setup do
    @paymentmethod = paymentmethods(:one)
  end

  test "visiting the index" do
    visit paymentmethods_url
    assert_selector "h1", text: "Paymentmethods"
  end

  test "should create paymentmethod" do
    visit paymentmethods_url
    click_on "New paymentmethod"

    fill_in "Name", with: @paymentmethod.name
    click_on "Create Paymentmethod"

    assert_text "Paymentmethod was successfully created"
    click_on "Back"
  end

  test "should update Paymentmethod" do
    visit paymentmethod_url(@paymentmethod)
    click_on "Edit this paymentmethod", match: :first

    fill_in "Name", with: @paymentmethod.name
    click_on "Update Paymentmethod"

    assert_text "Paymentmethod was successfully updated"
    click_on "Back"
  end

  test "should destroy Paymentmethod" do
    visit paymentmethod_url(@paymentmethod)
    click_on "Destroy this paymentmethod", match: :first

    assert_text "Paymentmethod was successfully destroyed"
  end
end
