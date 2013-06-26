class CreateTagsTable < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :question_id
      t.timestamps
    end
  end
end
