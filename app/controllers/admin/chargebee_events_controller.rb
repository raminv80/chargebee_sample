class Admin::ChargebeeEventsController < ApplicationController
  #require 'chargebee'
  #before_action :login_to_chargebee

  def index
  	@events = ChargebeeEvent.all
  end

  private

  def login_to_chargebee
  	ChargeBee.configure(:site => Settings[:mindvalley][:chargebee][:site], 
  		:api_key => Settings[:mindvalley][:chargebee][:api_key])
  end
end
