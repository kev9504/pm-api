class User < ApplicationRecord
    validates_presence_of :email, :name, :password_digest
    validates_uniqueness_of :email
    has_secure_password
    has_secure_token :auth_token
    has_and_belongs_to_many :projects
    has_many :activities
    
    def invalidate_token 
        self.update_columns(auth_token: nil)
    end 
    
    def self.validate_login(email, password)
        user = find_by(email: email)
        
        if user && user.authenticate(password)
            user
        end
    
    end
    
    def owner 
        Project.where(owner: self.id)
    end
end
