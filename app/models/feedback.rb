class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :feedback_on, polymorphic: true

  validates :info, presence: true
end
