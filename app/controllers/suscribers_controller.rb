class SuscribersController < ApplicationController
  allow_unauthenticated_access
  before_action :set_product

  def create
    @product.suscribers.where(suscribers_params).first_or_create
    redirect_to @product, notice: "You're now subscribed"
  end

  private
    def set_product
      @product = Product.find(params[:product_id])
    end

    def suscribers_params
      params.expect(suscriber: [ :email ])
    end
end
