class OrdersController < ApplicationController
  protect_from_forgery
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    order_created = true

    respond_to do |format|
      if @order.save
        book_ids = order_details_params
        book_ids.each do |book_id|

          actual_book_id = book_id.last
          next if actual_book_id.blank?

          logger.error(actual_book_id)
          ordersdetail = Ordersdetail.new(order_id: @order.order_id, book_id: actual_book_id)
          unless ordersdetail.save
            order_created = false
          end
        end

        if order_created
          format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
          format.json { render :show, status: :created, location: @order }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    orders_details = Ordersdetail.where(order_id: @order.order_id)
    orders_details.each do |orders_detail|
      orders_detail.destroy!
    end
    @order.destroy!

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:payment_method_id, :employee_id, :customer_id)
    end

    def order_details_params
      params.require(:order).permit(:book_id_1, :book_id_2, :book_id_3, :book_id_4, :book_id_5)
    end
end
