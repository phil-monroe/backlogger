class User < ActiveRecord::Base
  def self.from_google_omniauth(auth_hash)
    self.find_or_initialize_by(google_uid: auth_hash[:uid]).tap do |user|
      user.first_name ||= auth_hash.info.first_name
      user.last_name  ||= auth_hash.info.last_name
      user.email      ||= auth_hash.info.email
      user.image        = auth_hash.info.image
      user.save!
    end
  end
end
