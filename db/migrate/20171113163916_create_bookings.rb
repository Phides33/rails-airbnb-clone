class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.integer :number_of_guests
      t.integer :price
      t.date :check_in_on
      t.date :check_out_on
      t.string :status
      t.text :review
      t.integer :rating

      t.timestamps
    end
  end
end
