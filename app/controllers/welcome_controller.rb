class WelcomeController < ApplicationController
  require 'chargebee'

  before_action :login_to_chargebee

  def index
    # Calling ChargeBee Hosted Page API to create a new Subscription for the
    # specified planId and redirecting the customer to the ChargeBee server
    # using the url returned by ChargeBee Hosted Page API.
    # For demo purpose plan with id 'basic' is hard coded here.
    if(!session[:user_id].nil?)
      user = User.find(session[:user_id])
      
      subscriptions = Subscription.where(user_id: user.id)

      @subscriptions = subscriptions.map do |subscription|
        result = ChargeBee::Subscription.retrieve(subscription.subscription_id)
        if(result.class==ChargeBee::Result)
        {
          customer: result.customer,
          subscription: result.subscription,
          card: result.card
        } 
        end
      end

      if(@subscriptions.empty?)
        responseResult = ChargeBee::HostedPage.checkout_new({
          :subscription => {:plan_id=>"basic" }, 
          :customer => {
            :email => user.email, 
            :first_name => user.first_name, 
            :last_name => user.last_name, 
          },
          :billing_address => {
            :first_name => user.first_name, 
            :last_name => user.last_name, 
          },
          :embed => false
        })

        @basicPageUrl = responseResult.hosted_page.url
      end
    end
   
    render 'index'
  end

  private

  def login_to_chargebee
    ChargeBee.configure(:site => Settings[:mindvalley][:chargebee][:site], 
      :api_key => Settings[:mindvalley][:chargebee][:api_key])
  end
end
