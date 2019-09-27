class Question < ApplicationRecord
    validates :email, presence: true
    validates :body, presence: true, length: { in: 1..200 }
    
    belongs_to :faq
end
