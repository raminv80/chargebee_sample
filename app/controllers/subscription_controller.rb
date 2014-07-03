class SubscriptionController < ApplicationController
  require 'chargebee'

  before_action :login_to_chargebee

  def success
  	result = ChargeBee::Subscription.retrieve(params[:sub_id])
  	if(result.class==ChargeBee::Result)
		@customer = result.customer
		@subscription = result.subscription
		@card = result.card
	end
  end

  private

  def login_to_chargebee
  	ChargeBee.configure(:site => Settings[:mindvalley][:chargebee][:site], 
  		:api_key => Settings[:mindvalley][:chargebee][:api_key])
  end
end
