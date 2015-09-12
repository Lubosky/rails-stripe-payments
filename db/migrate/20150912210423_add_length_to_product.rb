class AddLengthToProduct < ActiveRecord::Migration
	def change
		add_column :products, :length, :string
	end
end
