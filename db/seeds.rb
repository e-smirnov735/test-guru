# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!(
  [
    { title: 'Ruby' },
    { title: 'Javascript' },
    { title: 'HTML' },
    { title: 'SQL' }
  ]
)
users = User.create!(
  [
    { name: 'Alex', password: '1111' },
    { name: 'Masha', password: '2222' },
    { name: 'Sasha', password: '3333' }
  ]
)
tests = Test.create!(
  [
    { title: 'Типы данных Ruby', level: 0, author_id: 1,
      category_id: Category.find_by(title: 'Ruby').id },
    { title: 'ООП Ruby', level: 1, author_id: 1,
      category_id: Category.find_by(title: 'Ruby').id },
    { title: 'Типы данных Javascript', level: 0, author_id: 1,
      category_id: Category.find_by(title: 'Javascript').id },
    { title: 'Операции с массивами Javascript', level: 1, author_id: 1,
      category_id: Category.find_by(title: 'Javascript').id },
    { title: 'HTML тэги', level: 0, author_id: 1,
      category_id: Category.find_by(title: 'HTML').id },
    { title: 'HTML семантика', level: 3, author_id: 1,
      category_id: Category.find_by(title: 'HTML').id },
    { title: 'SQL CRUD - операции', level: 1, author_id: 1,
      category_id: Category.find_by(title: 'SQL').id  },
    { title: 'SQL Join - операции', level: 3, author_id: 1,
      category_id: Category.find_by(title: 'SQL').id  }
  ]
)
questions = Question.create!(
  [
    { body: 'Тип данных, которого нет в Ruby',
      test_id: Test.find_by(title: 'Типы данных Ruby').id },
    { body: 'Как обозначается наследование в Ruby',
      test_id: Test.find_by(title: 'ООП Ruby').id },
    { body: 'Выберете типы данных, которые есть Javascript',
      test_id: Test.find_by(title: 'Типы данных Javascript').id },
    { body: 'Метод массива, который изменяет каждый элемент',
      test_id: Test.find_by(title: 'Операции с массивами Javascript').id },
    { body: 'Назовите тэг, обозначающий параграф',
      test_id: Test.find_by(title: 'HTML тэги').id },
    { body: 'Назовите тэг, обозначающий нижний раздел на сайте',
      test_id: Test.find_by(title: 'HTML семантика').id },
    { body: 'Команда для удаления элементов из таблицы',
      test_id: Test.find_by(title: 'SQL CRUD - операции').id },
    { body: 'Какие виды JOIN бывают',
      test_id: Test.find_by(title: 'SQL Join - операции').id }
  ]
)

answers = Answer.create!(
  [
    { body: 'String', correct: false,
      question_id: Question.find_by(body: 'Тип данных, которого нет в Ruby').id },
    { body: 'LinkedList', correct: true,
      question_id: Question.find_by(body: 'Тип данных, которого нет в Ruby').id },
    { body: 'Array', correct: false,
      question_id: Question.find_by(body: 'Тип данных, которого нет в Ruby').id },
    { body: '<', correct: true,
      question_id: Question.find_by(body: 'Как обозначается наследование в Ruby').id },
    { body: 'extend', correct: false,
      question_id: Question.find_by(body: 'Как обозначается наследование в Ruby').id },
    { body: 'implement', correct: false,
      question_id: Question.find_by(body: 'Как обозначается наследование в Ruby').id },
    { body: 'Object', correct: true,
      question_id: Question.find_by(body: 'Выберете типы данных, которые есть Javascript').id },
    { body: 'Hash', correct: false,
      question_id: Question.find_by(body: 'Выберете типы данных, которые есть Javascript').id },
    { body: 'Null', correct: true,
      question_id: Question.find_by(body: 'Выберете типы данных, которые есть Javascript').id },
    { body: 'map', correct: true,
      question_id: Question.find_by(body: 'Метод массива, который изменяет каждый элемент').id },
    { body: 'filter', correct: false,
      question_id: Question.find_by(body: 'Метод массива, который изменяет каждый элемент').id },
    { body: 'reduce', correct: false,
      question_id: Question.find_by(body: 'Метод массива, который изменяет каждый элемент').id },
    { body: '<br>', correct: false,
      question_id: Question.find_by(body: 'Назовите тэг, обозначающий параграф').id },
    { body: '<a>', correct: false,
      question_id: Question.find_by(body: 'Назовите тэг, обозначающий параграф').id },
    { body: '<p>', correct: true,
      question_id: Question.find_by(body: 'Назовите тэг, обозначающий параграф').id },
    { body: '<body>', correct: false,
      question_id: Question.find_by(body: 'Назовите тэг, обозначающий нижний раздел на сайте').id },
    { body: '<footer>', correct: true,
      question_id: Question.find_by(body: 'Назовите тэг, обозначающий нижний раздел на сайте').id },
    { body: '<header>', correct: false,
      question_id: Question.find_by(body: 'Назовите тэг, обозначающий нижний раздел на сайте').id },
    { body: 'DROP', correct: false,
      question_id: Question.find_by(body: 'Команда для удаления элементов из таблицы').id },
    { body: 'DELETE', correct: true,
      question_id: Question.find_by(body: 'Команда для удаления элементов из таблицы').id },
    { body: 'REMOVE', correct: false,
      question_id: Question.find_by(body: 'Команда для удаления элементов из таблицы').id },
    { body: 'LEFT JOIN', correct: true,
      question_id: Question.find_by(body: 'Какие виды JOIN бывают').id },
    { body: 'RIGHT JOIN', correct: true,
      question_id: Question.find_by(body: 'Какие виды JOIN бывают').id },
    { body: 'TOP JOIN', correct: false,
      question_id: Question.find_by(body: 'Какие виды JOIN бывают').id }
  ]
)

users_tests = UsersTest.create!(
  [
    { user_id: User.find_by(name: 'Alex').id,
      test_id: Test.find_by(title: 'Типы данных Ruby').id },
    { user_id: User.find_by(name: 'Alex').id,
      test_id: Test.find_by(title: 'HTML тэги').id },
    { user_id: User.find_by(name: 'Masha').id,
      test_id: Test.find_by(title: 'Типы данных Ruby').id },
    { user_id: User.find_by(name: 'Masha').id,
      test_id: Test.find_by(title: 'SQL CRUD - операции').id },
    { user_id: User.find_by(name: 'Masha').id,
      test_id: Test.find_by(title: 'SQL Join - операции').id },
    { user_id: User.find_by(name: 'Sasha').id,
      test_id: Test.find_by(title: 'Типы данных Javascript').id },
    { user_id: User.find_by(name: 'Sasha').id,
      test_id: Test.find_by(title: 'Операции с массивами Javascript').id },
    { user_id: User.find_by(name: 'Sasha').id,
      test_id: Test.find_by(title: 'HTML тэги').id }
  ]
)
