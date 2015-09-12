class CreateProducts < ActiveRecord::Migration
	def change
		create_table :products do |t|
			t.string :title
			t.string :subtitle
			t.string :author
			t.text :description
			t.string :sku
			t.decimal :price
			t.timestamps null: false
		end
	end
end
