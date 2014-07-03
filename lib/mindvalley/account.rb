module Mindvalley

  class Account

    def self.get_user(token)
      require 'open-uri'
      url = [server, "me", Account.auth(token)].join
      hash = JSON.parse(open(url).read)
      hash["user"]
    rescue Exception => e
      Rails.logger.error 'Exception intercepted calling Accounts#get_user'
      Rails.logger.error e.message
      Rails.logger.error e.backtrace.join("\n")
      return nil
    end

    private
    def self.auth(token)
      "?access_token=#{token}"
    end

    def self.server
      Settings.mindvalley.accounts.api
    end
  end

end