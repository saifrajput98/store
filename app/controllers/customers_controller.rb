# frozen_string_literal: true

class CustomersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_customer, only: %i[show edit update destroy]

  def index
    @pagy, @customers = pagy(Customer.all, items: 4)
  end

  def show; end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to @customer, notice: 'Customer created successfully'
    else
      render 'edit'
    end
  end

  def edit; end

  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: 'Customer updated successfully'
    else
      render 'edit'
    end
  end

  def destroy
    @customer.destroy

    redirect_to @customer, notice: 'Customer updated successfully'
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :address, :contact1, :contact2, :email)
  end
end
