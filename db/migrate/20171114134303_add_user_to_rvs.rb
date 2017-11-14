class AddUserToRvs < ActiveRecord::Migration[5.0]
  def change
    add_reference :rvs, :user, foreign_key: true
  end
end
