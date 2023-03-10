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
    { title: 'Типы данных Ruby', level: 0,
      author_id: users[0].id, category_id: categories[0].id },
    { title: 'ООП Ruby', level: 1,
      author_id: users[0].id, category_id: categories[0].id },
    { title: 'Типы данных Javascript', level: 0,
      author_id: users[0].id, category_id: categories[1].id },
    { title: 'Операции с массивами Javascript', level: 1,
      author_id: users[0].id, category_id: categories[1].id },
    { title: 'HTML тэги', level: 0,
      author_id: users[0].id, category_id: categories[2].id },
    { title: 'HTML семантика', level: 3,
      author_id: users[0].id, category_id: categories[2].id },
    { title: 'SQL CRUD - операции', level: 1,
      author_id: users[0].id, category_id: categories[3].id  },
    { title: 'SQL Join - операции', level: 3,
      author_id: users[0].id, category_id: categories[3].id  }
  ]
)
questions = Question.create!(
  [
    { body: 'Тип данных, которого нет в Ruby',
      test_id: tests[0].id },
    { body: 'Как обозначается наследование в Ruby',
      test_id: tests[1].id },
    { body: 'Выберете типы данных, которые есть Javascript',
      test_id: tests[2].id },
    { body: 'Метод массива, который изменяет каждый элемент',
      test_id: tests[3].id },
    { body: 'Назовите тэг, обозначающий параграф',
      test_id: tests[4].id },
    { body: 'Назовите тэг, обозначающий нижний раздел на сайте',
      test_id: tests[5].id },
    { body: 'Команда для удаления элементов из таблицы',
      test_id: tests[6].id },
    { body: 'Какие виды JOIN бывают',
      test_id: tests[7].id }
  ]
)

answers = Answer.create!(
  [
    { body: 'String', correct: false, question_id: questions[0].id },
    { body: 'LinkedList', correct: true, question_id: questions[0].id },
    { body: 'Array', correct: false, question_id: questions[0].id },
    { body: '<', correct: true, question_id: questions[1].id },
    { body: 'extend', correct: false, question_id: questions[1].id },
    { body: 'implement', correct: false, question_id: questions[1].id },
    { body: 'Object', correct: true, question_id: questions[2].id },
    { body: 'Hash', correct: false, question_id: questions[2].id },
    { body: 'Null', correct: true, question_id: questions[2].id },
    { body: 'map', correct: true, question_id: questions[3].id },
    { body: 'filter', correct: false, question_id: questions[3].id },
    { body: 'reduce', correct: false, question_id: questions[3].id },
    { body: '<br>', correct: false, question_id: questions[4].id },
    { body: '<a>', correct: false, question_id: questions[4].id },
    { body: '<p>', correct: true, question_id: questions[4].id },
    { body: '<body>', correct: false, question_id: questions[5].id },
    { body: '<footer>', correct: true, question_id: questions[5].id },
    { body: '<header>', correct: false, question_id: questions[5].id },
    { body: 'DROP', correct: false, question_id: questions[6].id },
    { body: 'DELETE', correct: true, question_id: questions[6].id },
    { body: 'REMOVE', correct: false, question_id: questions[6].id },
    { body: 'LEFT JOIN', correct: true, question_id: questions[7].id },
    { body: 'RIGHT JOIN', correct: true, question_id: questions[7].id },
    { body: 'TOP JOIN', correct: false, question_id: questions[7].id }
  ]
)

users_tests = UsersTest.create!(
  [
    { user_id: users[0].id, test_id: tests[0].id },
    { user_id: users[0].id, test_id: tests[4].id },
    { user_id: users[1].id, test_id: tests[0].id },
    { user_id: users[1].id, test_id: tests[6].id },
    { user_id: users[1].id, test_id: tests[7].id },
    { user_id: users[2].id, test_id: tests[2].id },
    { user_id: users[2].id, test_id: tests[3].id },
    { user_id: users[2].id, test_id: tests[4].id }
  ]
)
