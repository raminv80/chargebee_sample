class Subscription < ActiveRecord::Base

  def self.find_or_create_subscription(user_id, subscription_id, customer_id)
	subscriber = self.where({user_id: user_id, subscription_id: subscription_id}).first
	return nil unless subscriber.nil?
	subscriber = self.new(user_id: user_id, subscription_id: subscription_id, customer_id: customer_id)
	subscriber.save!
	subscriber
  end
end
