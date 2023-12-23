require "application_system_test_case"

class OrdersdetailsTest < ApplicationSystemTestCase
  setup do
    @ordersdetail = ordersdetails(:one)
  end

  test "visiting the index" do
    visit ordersdetails_url
    assert_selector "h1", text: "Ordersdetails"
  end

  test "should create ordersdetail" do
    visit ordersdetails_url
    click_on "New ordersdetail"

    fill_in "Book", with: @ordersdetail.book_id
    fill_in "Order", with: @ordersdetail.order_id
    click_on "Create Ordersdetail"

    assert_text "Ordersdetail was successfully created"
    click_on "Back"
  end

  test "should update Ordersdetail" do
    visit ordersdetail_url(@ordersdetail)
    click_on "Edit this ordersdetail", match: :first

    fill_in "Book", with: @ordersdetail.book_id
    fill_in "Order", with: @ordersdetail.order_id
    click_on "Update Ordersdetail"

    assert_text "Ordersdetail was successfully updated"
    click_on "Back"
  end

  test "should destroy Ordersdetail" do
    visit ordersdetail_url(@ordersdetail)
    click_on "Destroy this ordersdetail", match: :first

    assert_text "Ordersdetail was successfully destroyed"
  end
end
