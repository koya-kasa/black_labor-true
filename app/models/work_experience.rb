class WorkExperience < ApplicationRecord
    validates :title, presence: true, uniqueness: true, length: { in: 1..35 }
    validates :body, presence: true, uniqueness: true, length: { in: 1..10000 }
    validates :tag_list, presence: true, length: { in: 1..30 }
    
    belongs_to :user
    
    acts_as_taggable
end
