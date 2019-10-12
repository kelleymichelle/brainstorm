class CreateInvestors < ActiveRecord::Migration[6.0]
  def change
    create_table :investors do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.text :bio
      t.string :location

      t.timestamps
    end
  end
end
