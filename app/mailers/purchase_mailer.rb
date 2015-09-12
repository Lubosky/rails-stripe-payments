class PurchaseMailer < ActionMailer::Base
	
	layout 'purchase_mailer'

	default from: "payments@example.com"

	def purchase_receipt purchase
		@purchase = purchase
		@product = Product.find(purchase.product_id)
		mail to: purchase.email, subject: "He isn't dead, Jim"
	end

end