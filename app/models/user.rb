class User < ApplicationRecord
    has_secure_password
    
    def self.ransackable_attributes(auth_object = nil)
        %w[name email]
    end
    
    def self.ransackable_associations(auth_object = nil)
        []
    end
    
    
    validates :name, presence: true, length: {maximum: 15}
    validates :email, presence: true, uniqueness: true
    validates :profile, length: {maximum: 1000}
    validates :password, length: {in: 4..15}, presence: true
    
end
