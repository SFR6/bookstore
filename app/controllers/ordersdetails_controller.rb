class OrdersdetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ordersdetail, only: %i[ show edit update destroy ]

  # GET /ordersdetails or /ordersdetails.json
  def index
    return
    @ordersdetails = Ordersdetail.all
  end

  # GET /ordersdetails/1 or /ordersdetails/1.json
  def show
    return
  end

  # GET /ordersdetails/new
  def new
    return
    @ordersdetail = Ordersdetail.new
  end

  # GET /ordersdetails/1/edit
  def edit
    return
  end

  # POST /ordersdetails or /ordersdetails.json
  def create
    return
    @ordersdetail = Ordersdetail.new(ordersdetail_params)

    respond_to do |format|
      if @ordersdetail.save
        format.html { redirect_to ordersdetail_url(@ordersdetail), notice: "Ordersdetail was successfully created." }
        format.json { render :show, status: :created, location: @ordersdetail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ordersdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordersdetails/1 or /ordersdetails/1.json
  def update
    return
    respond_to do |format|
      if @ordersdetail.update(ordersdetail_params)
        format.html { redirect_to ordersdetail_url(@ordersdetail), notice: "Ordersdetail was successfully updated." }
        format.json { render :show, status: :ok, location: @ordersdetail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ordersdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordersdetails/1 or /ordersdetails/1.json
  def destroy
    return
    @ordersdetail.destroy!

    respond_to do |format|
      format.html { redirect_to ordersdetails_url, notice: "Ordersdetail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ordersdetail
      @ordersdetail = Ordersdetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ordersdetail_params
      params.require(:ordersdetail).permit(:order_id, :book_id)
    end
end
