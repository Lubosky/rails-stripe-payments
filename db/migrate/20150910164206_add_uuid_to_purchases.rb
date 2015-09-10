class AddUuidToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :uuid, :string
  end
end
