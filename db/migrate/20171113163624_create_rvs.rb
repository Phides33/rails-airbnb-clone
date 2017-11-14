class CreateRvs < ActiveRecord::Migration[5.0]
  def change
    create_table :rvs do |t|
      t.string :name
      t.integer :number_of_guests
      t.string :localisation
      t.string :kind
      t.integer :number_of_beds
      t.integer :price_per_night
      t.integer :min_stay

      t.timestamps
    end
  end
end
