class PaymentmethodsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_paymentmethod, only: %i[ show edit update destroy ]

  # GET /paymentmethods or /paymentmethods.json
  def index
    @paymentmethods = Paymentmethod.order(:name)
  end

  # GET /paymentmethods/1 or /paymentmethods/1.json
  def show
  end

  # GET /paymentmethods/new
  def new
    @paymentmethod = Paymentmethod.new
  end

  # GET /paymentmethods/1/edit
  def edit
  end

  # POST /paymentmethods or /paymentmethods.json
  def create
    @paymentmethod = Paymentmethod.new(paymentmethod_params)

    respond_to do |format|
      if @paymentmethod.save
        format.html { redirect_to paymentmethod_url(@paymentmethod), notice: "Paymentmethod was successfully created." }
        format.json { render :show, status: :created, location: @paymentmethod }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @paymentmethod.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paymentmethods/1 or /paymentmethods/1.json
  def update
    respond_to do |format|
      if @paymentmethod.update(paymentmethod_params)
        format.html { redirect_to paymentmethod_url(@paymentmethod), notice: "Paymentmethod was successfully updated." }
        format.json { render :show, status: :ok, location: @paymentmethod }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @paymentmethod.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paymentmethods/1 or /paymentmethods/1.json
  def destroy
    @paymentmethod.destroy!

    respond_to do |format|
      format.html { redirect_to paymentmethods_url, notice: "Paymentmethod was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paymentmethod
      @paymentmethod = Paymentmethod.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def paymentmethod_params
      params.require(:paymentmethod).permit(:name)
    end
end
