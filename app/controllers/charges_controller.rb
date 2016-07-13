class ChargesController < ApplicationController
def new
end

def create
	  # Amount in cents
	  token = params[:stripeToken]

	  customer = Stripe::Customer.create(
		  :source => token, # obtained from Stripe.js
		  :plan => "2495monthly",
		  :email => current_user.email,
		  #:coupon => "coupon_ID"
	  	)

	  current_user.subscribed = true
	  current_user.save!
	  
	  redirect_to root_path

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end

end