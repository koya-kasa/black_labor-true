class WorkExperienceComment < ApplicationRecord
    validates :body, presence: true, length: { in: 1..100 }
    
    belongs_to :user
    belongs_to :work_experience
    
    scope :created_at_paging, -> { order(created_at: :desc) }
end
