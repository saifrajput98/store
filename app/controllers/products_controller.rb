# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy top_up]

  def index
    @pagy, @products = pagy(Product.search(params[:term]), items:5)
  end

  def show; end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def top_up; end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private

  def set_product
    if Product.exists?(params[:id])
      @product = Product.find(params[:id])
    else
      redirect_to products_path, notice: 'Record not found.'
    end
  end

  def product_params
    params.require(:product).permit(:title, :description, :unit_price, :quantity, :product_code, :image)
  end
end
