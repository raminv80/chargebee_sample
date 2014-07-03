class CreateSubscription < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :user, index: true
      t.string :customer_id
      t.string :subscription_id
    end
  end
end
