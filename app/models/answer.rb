class Answer < ApplicationRecord
  scope :on_correct, -> { where(correct: true) }

  belongs_to :question

  validates :body, presence: true
end
