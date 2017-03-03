class CreateSurvivors < ActiveRecord::Migration[5.0]
  def change
    create_table :survivors do |t|
      t.string :name
      t.integer :age
      t.integer :gender
      t.boolean :infected, default: false
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.text :inventory, default: { water: 0, food: 0, medication: 0, ammunition: 0 }.to_yaml

      t.timestamps
    end
  end
end
