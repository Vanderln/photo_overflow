class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password, null: false
      t.string :email, null: false
      t.string :file
      t.integer :reputation
      t.string :location
    end
  end
end
