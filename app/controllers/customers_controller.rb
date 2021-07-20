# frozen_string_literal: true

class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show edit update destroy]

  def index
    @pagy, @customers = pagy(Customer.search(params[:term]), items: 5)
  end

  def show; end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to customers_path, notice: 'Customer created successfully.'
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @customer.update(customer_params)
      redirect_to customers_path, notice: 'Customer updated successfully.'
    else
      render 'edit'
    end
  end

  def destroy
    @customer.destroy

    redirect_to @customer, notice: 'Customer destroyed successfully.'
  end

  private

  def set_customer
    @customer = Customer.find_by( id: params[:id])
    redirect_to customers_path, notice: 'Record not found.' unless @customer.present?
  end

  def customer_params
    params.require(:customer).permit(:name, :address, :contact1, :contact2, :email)
  end
end
