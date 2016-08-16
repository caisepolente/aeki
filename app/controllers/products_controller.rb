class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    product_params = params.require( :product ).permit( :name, :description, :image, :price )

    @product = Product.new( product_params )

    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end


end
