class CreatePostUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :post_users do |t|
      t.integer :post_id, null: false
      t.integer :user_id, null: false
      t.boolean :owner_boolean

      t.timestamps
    end
  end
end
