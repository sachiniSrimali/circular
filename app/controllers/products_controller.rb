class ProductsController < ApplicationController

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  private

  def product_params
    params.require(:product).permit(:title, :category, :description, :condition, :price)
  end
end
