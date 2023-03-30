module QuestionsHelper
  def question_header(question)
    action = question.new_record? ? "Создать" : "Редактировать"
    "#{action} вопрос для теста: #{question.test.title}."
  end
end
