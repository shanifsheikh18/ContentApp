class Content < ApplicationRecord
    has_many :user_contents
    has_many :users, through: :user_contents
    
    validates :title, presence: true, length: { minimum: 3, maximum: 25 }
    validates :description, presence: true, length: { minimum: 10, maximum: 100 }
end