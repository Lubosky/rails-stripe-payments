class Product < ActiveRecord::Base
	def full_description
		"#{self.title} #{self.subtitle}"		
	end

	def price_in_cents
		(self.price * 100).to_i		
	end
end
