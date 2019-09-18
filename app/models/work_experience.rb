class WorkExperience < ApplicationRecord
    validates :title, presence: true, uniqueness: true, length: { in: 1..35 }
    validates :body, presence: true, uniqueness: true, length: { in: 1..10000 }
    validates :tag_list, presence: true, length: { in: 1..30 }
    
    belongs_to :user
    has_many :work_experience_comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :work_experience_looked_histories, dependent: :destroy

    acts_as_taggable
    
    def self.ransackable_attributes(auth_object = nil)
        %w[title]
    end

    def self.ransackable_associations(auth_object = nil)
        %w[user tags taggings]
    end
end
