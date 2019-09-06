class Like < ApplicationRecord
    belongs_to :user
    belongs_to :work_experience
    
    def check_current_user_likes(we_id)
        current_user && current_user.likes.find_by(work_experience_id: we_id)
    end
end
