class CreateTagcloudsTable < ActiveRecord::Migration
  def change
    create_table :tagclouds do |t|
      t.references :question
      t.references :tag
      t.timestamps
    end
  end
end
