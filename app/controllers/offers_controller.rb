class OffersController < ApplicationController
  def index
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def create
    # creating offer and linking it to the product and all

    @product = Product.find(params[:product_id])
    @offer = Offer.new(user_sender: current_user, user_receiver: @product.user, status: "pending")

    OfferProduct.create(offer: @offer, product: @product)
    # current_user.products.each do |product|
    #   OfferProduct.create(offer: @offer, product: product)
    # end

    @offer.save
    redirect_to products_path
  end

  def create_counter_offer
    @their_product = Product.find(params[:offer][:their_product])
    @offer = Offer.find(params[:offer][:offer_id])
    @offer.pending!
    OfferProduct.create(offer: @offer, product: @their_product)
    redirect_to dashboard_path
  end
end
