# frozen_string_literal: true

class ReceiptsController < ApplicationController
  before_action :set_receipt, only: %i[show edit update destroy]

  def index
    @receipts = Receipt.search(params[:search])
  end

  def show; end

  def new
    @receipt = Receipt.new
  end

  def edit; end

  def create
    @receipt = Receipt.new(receipt_params)

    respond_to do |format|
      if @receipt.save
        format.html { redirect_to @receipt, notice: 'Receipt was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @receipt.update(receipt_params)
        format.html { redirect_to @receipt, notice: 'Receipt was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @receipt.destroy
    respond_to do |format|
      format.html { redirect_to receipts_url, notice: 'Receipt was successfully destroyed.' }
    end
  end

  private

  def set_receipt
    @receipt = Receipt.find(params[:id])
  end

  def receipt_params
    params.require(:receipt).permit(:net_amt, :gross_amt, :discount_amt, :receipt_type, :customer_id,
                                    line_item_attributes: %i[id quantity price discount customer_id _destroy])
  end
end
