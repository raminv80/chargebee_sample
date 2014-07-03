class Api::V1::ApiController < RocketPants::Base
  jsonp

  before_filter :protect_api

  protected

  def protect_api
    error! :unauthenticated if params[:secret] != Settings[:mindvalley][:chargebee][:shared_secret]
  end
end
