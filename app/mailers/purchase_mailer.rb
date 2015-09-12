class PurchaseMailer < ActionMailer::Base
	
	layout 'purchase_mailer'

	default from: "He isn't dead Jim"

	def purchase_receipt purchase
		@purchase = purchase

		mail to: purchase.email, subject: "Thanks for receiving this email!"

	end

end