class ChargesController < ApplicationController

	def new
	end

	def create
		product = Product.find_by_sku("GROHACK1")

		customer = Stripe::Customer.create(
			:email => params[:stripeEmail],
			:card  => params[:stripeToken]
		)

		charge = Stripe::Charge.create(
			:customer    => customer.id,
			:amount      => product.price_in_cents,
			:description => product.full_description,
			:currency    => 'usd'
		)

		purchase = Purchase.create(	email: params[:stripeEmail],
																card: params[:stripeToken],
																amount: product.price_in_cents,
																description: charge.description,
																currency: charge.currency,
																customer_id: customer.id,
																product_id: product.id,
																uuid: SecureRandom.uuid)
		redirect_to purchase

	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to charges_path
	end

end