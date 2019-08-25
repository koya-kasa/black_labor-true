class WorkExperienceComment < ApplicationRecord
    validates :body, presence: true, length: { in: 1..100 }
    
    belongs_to :user
    belongs_to :work_experience
end
