class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_count_of_answers, on: create

  scope :correct, -> { where(correct: true) }

  private

  def validate_count_of_answers
    return if question.answers.count < 4

    errors.add(:base, message: "max answers for question is 4")
  end
end
