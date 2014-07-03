class SubscriptionController < ApplicationController
  require 'chargebee'

  before_action :login_to_chargebee

  def success
    if params['state'] == "succeeded" 
      # request comes from checkout new hosted page
      # Request the ChargeBee server about the Hosted page state and give the details
      # about the subscription created.
      subscription_id = params['id']
      result =  ChargeBee::HostedPage.retrieve(subscription_id)
      hosted_page = result.hosted_page
      if hosted_page.state != "succeeded"
        redirect_to "/400"
        return
      end
      @customer = result.hosted_page.content.customer
      @subscription = result.hosted_page.content.subscription
      @card = result.hosted_page.content.card
      handle_subscription(@customer, @subscription)
    else
      #request comes from hosted checkout page
      result = ChargeBee::Subscription.retrieve(params[:sub_id])
      if(result.class==ChargeBee::Result)
        @customer = result.customer
        @subscription = result.subscription
        @card = result.card
        handle_subscription(@customer, @subscription)
      else
       redirect_to "/400"
      end
    end

  end

  private

  def login_to_chargebee
  	ChargeBee.configure(:site => Settings[:mindvalley][:chargebee][:site], 
  		:api_key => Settings[:mindvalley][:chargebee][:api_key])
  end

  def handle_subscription(customer, subscription)
    subscription_id = subscription.id
    customer_id = customer.id
    email = customer.email
    Subscription.find_or_create_subscription(email, subscription_id, customer_id)
  end
end
