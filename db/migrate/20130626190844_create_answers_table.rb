class CreateAnswersTable < ActiveRecord::Migration
  def change
  create_table :answers do |t|
      t.integer :user_id
      t.string :content
      t.string :file
      t.string :path
    end
  end
end
