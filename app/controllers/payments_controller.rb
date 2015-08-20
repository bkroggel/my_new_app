class PaymentsController < ApplicationController
  def create
    token = params[:stripeToken]
    @product = Product.find(params[:product_id])
    # @user = User.find(params[:user_id]

    begin
      charge = Stripe::Charge.create(
        :amount => (@product.price * 100).to_i,
        :currency => "eur",
        :source => token,
        :description => "#{params[:product_name]} ordered by STRIPE_MAIL(#{params[:stripeEmail]}"
      )
    

    rescue Stripe::CardError => e
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
      # The card has been declined
    end
    redirect_to product_path(@product)
  end
end