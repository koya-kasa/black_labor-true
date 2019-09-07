class User < ApplicationRecord
    has_secure_password
    
    def self.ransackable_attributes(auth_object = nil)
        %w[name email]
    end
    
    validates :name, presence: true, length: { maximum: 15 }
    validates :email, presence: true, uniqueness: true
    validates :profile, length: { maximum: 1000 }
    validates :password, length: { in: 4..15 }, presence: true
    
    has_many :work_experiences
    has_many :work_experience_comments
    has_many :likes
    
    
    def check_current_user_likes_blank?(we_id, current_user_id)
        Like.find_by(work_experience_id: we_id, user_id: current_user_id).blank?
    end
end
