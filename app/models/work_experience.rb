class WorkExperience < ApplicationRecord
    validates :title, presence: true, uniqueness: true, length: {in: 1..35}
    validates :body, presence: true, uniqueness: true, length: {in: 1..10000}
    validates :user_id, presence: true
end
