class ChargesController < ApplicationController

	def new
	end

	def create
		# Amount in cents
		@amount = 500

		customer = Stripe::Customer.create(
			:email => params[:stripeEmail],
			:card  => params[:stripeToken]
		)

		charge = Stripe::Charge.create(
			:customer    => customer.id,
			:amount      => params[:amount],
			:description => 'Growth Hacking Crash Course',
			:currency    => 'usd'
		)

		purchase = Purchase.create(	email: params[:stripeEmail],
																card: params[:stripeToken],
																amount: params[:amount],
																description: charge.description,
																currency: charge.currency,
																customer_id: customer.id,
																product_id: 1)
		redirect_to purchase

	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to charges_path
	end

end