class CreateInventors < ActiveRecord::Migration[6.0]
  def change
    create_table :inventors do |t|
      t.string :name
      t.string :location
      t.text :bio

      t.timestamps
    end
  end
end
