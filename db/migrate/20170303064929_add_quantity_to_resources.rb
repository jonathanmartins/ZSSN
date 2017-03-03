class AddQuantityToResources < ActiveRecord::Migration[5.0]
  def change
    add_column :resources, :quantity, :integer
  end
end
