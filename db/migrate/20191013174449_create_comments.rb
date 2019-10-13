class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.integer :idea_id
      t.integer :inventor_id

      t.timestamps
    end
  end
end
