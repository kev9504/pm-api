class User < ApplicationRecord
    validates_presence_of :email, :name, :password_digest
    validates_uniqueness_of :email
    has_secure_password
    has_many :projects, foreign_key: :owner
    has_secure_token :auth_token
    
    def invalidate_token 
        self.update_columns(auth_token: nil)
    end 
    
    def self.validate_login(email, password)
        user = find_by(email: email)
        
        if user && user.authenticate(password)
            user
        end
    
    end
end
