class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate :validate_count_of_answers

  private

  def validate_count_of_answers
    errors.add(:count_of_answers) unless answers.count in 1..4
  end
end
