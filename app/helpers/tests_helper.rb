module TestsHelper
  TITLES = {
    "new" => "Создать вопрос",
    "edit" => "Изменить вопрос",
    "show" => "Показать вопрос",
    "index" => "Список вопросов"
  }.freeze

  def question_header(test, action)
    action_title = TITLES[action]
    "#{action_title} для теста: #{test.title}."
  end
end
