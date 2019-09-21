class Like < ApplicationRecord
    belongs_to :user
    belongs_to :work_experience
    
    scope :created_at_paging, -> { order(created_at: :desc) }
end
