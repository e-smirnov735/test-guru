module TestsHelper
  TITLES = {
    "new" => "Создать вопрос",
    "edit" => "Изменить вопрос",
    "show" => "Показать вопрос",
    "index" => "Список вопросов"
  }.freeze

  def question_header
    action_title = TITLES[params[:action]]
    "#{action_title} для теста: #{@test.title}."
  end
end
