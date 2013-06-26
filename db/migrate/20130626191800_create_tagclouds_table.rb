class CreateTagcloudsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :question
      t.references :tag
      t.timestamps
    end
  end
end
