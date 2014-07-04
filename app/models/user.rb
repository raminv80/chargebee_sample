class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true

  def self.find_or_initialize_authenticated_user(auth_token)
    hash = Mindvalley::Account.get_user(auth_token)
    return nil if hash.nil?
    begin
      user = User.find_or_initialize_by(account_id: hash["id"])
      user.attributes = {
        email: hash['email'],
        first_name: hash['info']['first_name'],
        last_name: hash['info']['last_name'],
      }
      user
    rescue => e
      Rails.logger.error("Account has missing credentials")
      Rails.logger.error(hash.to_yaml)
      Rails.logger.error e.message
      Rails.logger.error e.backtrace.join("\n")
      raise MissingUserData, "Account #{hash['email']} is missing credentials"
    end
  end

  def self.find_or_create_authenticated_user(auth_token)
    user = User.find_or_initialize_authenticated_user(auth_token)
    return nil if user.nil?
    user.account_token = auth_token
    user.save! if user.changed?
    user
  end

end