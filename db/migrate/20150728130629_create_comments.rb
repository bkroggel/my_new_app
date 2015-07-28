class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.reference :user
      t.text :body
      t.integer :rating
      t.reference :product

      t.timestamps null: false
    end
  end
end
