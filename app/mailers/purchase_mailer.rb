class PurchaseMailer < ActionMailer::Base
	
	layout 'purchase_mailer'

	default from: "payments@example.com"

	def purchase_receipt purchase
		@purchase = purchase

		mail to: purchase.email, subject: "He isn't dead, Jim"
	end

end