class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @whishlist = Wishlist.find(params[:id])
  end

  def new
    @product = Product.new
    @categories = Category.new
  end

  def create
    @product = Product.create(product_params)
    @product.user = current_user
    if @product.save
      redirect_to my_profile_path(@user)
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:title, :photo, :category_id, :description, :condition, :price)
  end
end
