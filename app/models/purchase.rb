class Purchase < ActiveRecord::Base

	def to_param
		uuid		
	end

end
