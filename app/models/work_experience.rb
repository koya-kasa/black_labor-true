class WorkExperience < ApplicationRecord
    validates :title, presence: true, uniqueness: true, length: { in: 1..35 }
    validates :body, presence: true, uniqueness: true, length: { in: 1..10000 }
    
    belongs_to :user
    
    def post_user
        return User.find_by(id: self.user_id)
    end
end
