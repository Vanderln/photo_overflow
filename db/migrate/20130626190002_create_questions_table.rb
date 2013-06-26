class CreateQuestionsTable < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.string :title
      t.string :file
      t.string :content
      t.string :path
      t.timestamps
    end
  end
end
