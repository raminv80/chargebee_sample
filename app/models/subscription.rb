class Subscription < ActiveRecord::Base

  def self.find_or_create_subscription(email, subscription_id, customer_id)
  	user = User.where(email: email).first
	subscriber = self.where({user_id: user.id, subscription_id: subscription_id}).first
	return nil unless subscriber.nil?
	subscriber = self.new(user_id: user.id, subscription_id: subscription_id, customer_id: customer_id)
	subscriber.save!
	subscriber
  end
end
