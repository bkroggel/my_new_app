class PaymentsController < ApplicationController

  def create
    token = params[:stripeToken]
    @product = Product.find(params[:product_id])
    @user = current_user
      
    begin
      charge = Stripe::Charge.create(
        :amount => (@product.price * 100).to_i,
        :currency => "eur",
        :source => token,
        :description => "#{params[:product_name]} ordered by #{@user.first_name} #{@user.last_name} (STRIPE_MAIL: #{params[:stripeEmail]} | USER_MAIL: #{@user.email})"
      )
    

    rescue Stripe::CardError => e
      body = e.json_body
      err = body[:error]
      flash[:error] = "Hey #{@user.first_name}! Unfortunately, there was an error processing your payment: #{err[:message]}"
      # The card has been declined
    end
    redirect_to product_path(@product)
    flash[:notice] = "Hey #{@user.first_name}! Thanks for ordering #{@product.name}"
    UserMailer.order_confirmation_user(@user, @product).deliver_now
    UserMailer.order_confirmation_admin(@user, @product).deliver_now
  end
end