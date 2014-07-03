class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :account_id
      t.integer :account_token
      t.string :email

      t.timestamps
    end
  end
end
