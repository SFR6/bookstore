require "test_helper"

class OrdersdetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ordersdetail = ordersdetails(:one)
  end

  test "should get index" do
    get ordersdetails_url
    assert_response :success
  end

  test "should get new" do
    get new_ordersdetail_url
    assert_response :success
  end

  test "should create ordersdetail" do
    assert_difference("Ordersdetail.count") do
      post ordersdetails_url, params: { ordersdetail: { book_id: @ordersdetail.book_id, order_id: @ordersdetail.order_id } }
    end

    assert_redirected_to ordersdetail_url(Ordersdetail.last)
  end

  test "should show ordersdetail" do
    get ordersdetail_url(@ordersdetail)
    assert_response :success
  end

  test "should get edit" do
    get edit_ordersdetail_url(@ordersdetail)
    assert_response :success
  end

  test "should update ordersdetail" do
    patch ordersdetail_url(@ordersdetail), params: { ordersdetail: { book_id: @ordersdetail.book_id, order_id: @ordersdetail.order_id } }
    assert_redirected_to ordersdetail_url(@ordersdetail)
  end

  test "should destroy ordersdetail" do
    assert_difference("Ordersdetail.count", -1) do
      delete ordersdetail_url(@ordersdetail)
    end

    assert_redirected_to ordersdetails_url
  end
end
