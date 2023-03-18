class Answer < ApplicationRecord
  belongs_to :question

  scope :on_correct, -> { where(correct: true) }

  validates :body, presence: true
end
