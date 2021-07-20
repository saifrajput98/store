class ReceiptsController < ApplicationController
  before_action :set_receipt, only: %i[show edit update destroy send_mail]

  def index
    # @pagy, @receipts = pagy(Receipt.all)

    @receipts = Receipt.search(params[:term], params[:type])
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Receipt id #{@receipt.id}", template: 'receipts/invoice.html.erb', layout: 'pdf', page_size: 'A4'
      end
    end
  end

  def new
    @receipt = Receipt.new
  end

  def edit; end

  def create
    @receipt = Receipt.new(receipt_params)
    
    if @receipt.save
      redirect_to @receipt, notice: 'Receipt was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @receipt.update(receipt_params)
      redirect_to @receipt, notice: 'Receipt was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @receipt.destroy
    redirect_to receipts_url, notice: 'Receipt was successfully destroyed.'
  end

  def send_mail
    InvoiceMailer.new_invoice(@receipt).deliver_now
    redirect_to @receipt, notice: 'Mail has sent successfully.'
  end

  private

  def set_receipt
    if Receipt.exists?(params[:id])
      @receipt = Receipt.find(params[:id])
    else
      redirect_to store_index_path, notice: 'Record not found.'
    end
  end

  def receipt_params
    params.require(:receipt).permit(:net_amt, :gross_amt, :discount_amt, :receipt_type, :customer_id,:type,
                                    line_items_attributes: %i[id receipt_id quantity price discount product_id _destroy])
  end
end
