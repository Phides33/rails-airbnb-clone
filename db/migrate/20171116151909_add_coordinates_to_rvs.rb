class AddCoordinatesToRvs < ActiveRecord::Migration[5.0]
  def change
    add_column :rvs, :latitude, :float
    add_column :rvs, :longitude, :float
  end
end
