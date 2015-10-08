class User < ActiveRecord::Base

    def self.create_user! (params_hash)
          User.create!(user_id: params_hash[:user]["user_id"], email: params_hash[:user]["email"], session_token: SecureRandom.base64)
    end
end
