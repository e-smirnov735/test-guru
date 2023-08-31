class Result < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_first_question, on: :create

  PERCENT_FOR_PASS = 85

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answers?(answer_ids)

    self.is_passed = percent_of_correct_answers >= PERCENT_FOR_PASS
    self.current_question = next_question
    save!
  end

  def completed?
    current_question.nil? || (with_timer? && time_left.negative?)
  end

  def percent_of_correct_answers
    ((self.correct_questions.to_f / test.questions.count) * 100).round
  end

  def total_questions
    test.questions.count
  end

  def current_question_number
    total_questions - remaining_questions.count
  end

  def time_left
    self.test.timer_in_sec - (Time.now - created_at).to_i
  end

  def with_timer?
    self.test.timer_in_sec
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answers?(answer_ids)
    return correct_answers.ids.empty? if answer_ids.nil?

    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def remaining_questions
    test.questions.order(:id).where('id > ?', current_question.id)
  end

  def next_question
    remaining_questions.first
  end
end
