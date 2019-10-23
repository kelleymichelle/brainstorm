class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.integer :idea_id
      t.integer :investor_id
      t.text :notes

      t.timestamps
    end
  end
end
