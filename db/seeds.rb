# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create(
  [
    { title: 'Ruby' },
    { title: 'Javascript' },
    { title: 'HTML' },
    { title: 'SQL' }
  ]
)
users = User.create(
  [
    { name: 'Alex', password: '1111' },
    { name: 'Masha', password: '2222' },
    { name: 'Sasha', password: '3333' }
  ]
)
tests = Test.create(
  [
    { title: 'Типы данных Ruby', level: 0, author_id: 1, category_id: 1 },
    { title: 'ООП Ruby', level: 1, author_id: 1, category_id: 1 },
    { title: 'Типы данных Javascript', level: 0, author_id: 1, category_id: 2 },
    { title: 'Операции с массивами Javascript', level: 1, author_id: 1, category_id: 2 },
    { title: 'HTML тэги', level: 0, author_id: 1, category_id: 3 },
    { title: 'HTML семантика', level: 3, author_id: 1, category_id: 3 },
    { title: 'SQL CRUD - операции', level: 1, author_id: 1, category_id: 4 },
    { title: 'SQL Join - операции', level: 3, author_id: 1, category_id: 4 }
  ]
)
questions = Question.create(
  [
    { body: 'Тип данных, которого нет в Ruby', test_id: 1 },
    { body: 'Как обозначается наследование в Ruby', test_id: 2 },
    { body: 'Выберете типы данных, которые есть Javascript', test_id: 3 },
    { body: 'Метод массива, который изменяет каждый элемент', test_id: 4 },
    { body: 'Назовите тэг, обозначающий параграф', test_id: 5 },
    { body: 'Назовите тэг, обозначающий нижний раздел на сайте', test_id: 6 },
    { body: 'Команда для удаления элементов из таблицы', test_id: 7 },
    { body: 'Какие виды JOIN бывают', test_id: 8 }
  ]
)

answers = Answer.create(
  [
    { body: 'String', correct: false, question_id: 1 },
    { body: 'LinkedList', correct: true, question_id: 1 },
    { body: 'Array', correct: false, question_id: 1 },
    { body: '<', correct: true, question_id: 2 },
    { body: 'extend', correct: false, question_id: 2 },
    { body: 'implement', correct: false, question_id: 2 },
    { body: 'Object', correct: true, question_id: 3 },
    { body: 'Hash', correct: false, question_id: 3 },
    { body: 'Null', correct: true, question_id: 3 },
    { body: 'map', correct: true, question_id: 4 },
    { body: 'filter', correct: false, question_id: 4 },
    { body: 'reduce', correct: false, question_id: 4 },
    { body: '<br>', correct: false, question_id: 5 },
    { body: '<a>', correct: false, question_id: 5 },
    { body: '<p>', correct: true, question_id: 5 },
    { body: '<body>', correct: false, question_id: 6 },
    { body: '<footer>', correct: true, question_id: 6 },
    { body: '<header>', correct: false, question_id: 6 },
    { body: 'DROP', correct: false, question_id: 7 },
    { body: 'DELETE', correct: true, question_id: 7 },
    { body: 'REMOVE', correct: false, question_id: 7 },
    { body: 'LEFT JOIN', correct: true, question_id: 8 },
    { body: 'RIGHT JOIN', correct: true, question_id: 8 },
    { body: 'TOP JOIN', correct: false, question_id: 8 }
  ]
)

users_tests = UsersTest.create(
  [
    { user_id: 1, test_id: 1 },
    { user_id: 1, test_id: 3 },
    { user_id: 2, test_id: 1 },
    { user_id: 2, test_id: 7 },
    { user_id: 2, test_id: 8 },
    { user_id: 3, test_id: 3 },
    { user_id: 3, test_id: 4 },
    { user_id: 3, test_id: 5 }

  ]
)
