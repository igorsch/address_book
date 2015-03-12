class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :population
      t.string :elevation
      t.string :state

      t.timestamps null: false
    end
  end
end
