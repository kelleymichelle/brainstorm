class CreateIdeas < ActiveRecord::Migration[6.0]
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :description
      t.integer :fund_goal
      t.integer :inventor_id
      t.integer :group_id

      t.timestamps
    end
  end
end
