class Result < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_first_question, on: :create

  PERCENT_FOR_PASS = 85

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answers?(answer_ids)

    self.current_question = next_question
    save!
  end

  def completed?
    current_question.nil?
  end

  def passed?
    percent_of_correct_answers >= PERCENT_FOR_PASS
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

  def add_first_attempt_badge?
    Result.where("test_id = :test_id and user_id = :user_id",
                 { test_id: test.id, user_id: user.id }).count == 1 &&
      user.badges.find_by(rule: "All backend").nil?
  end

  def add_first_attempt_badge
    badge = Badge.find_by rule: "All backend"
    user.badges.push(badge)
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
