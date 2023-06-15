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
    { first_name: 'Alex', last_name: 'Ivanov', email: "alex@mail.ru", password: '111111' },
    { first_name: 'Masha', last_name: 'Petrov', email: "masha@mail.ru", password: '222222' },
    { first_name: 'Sasha', last_name: 'Sidorov', email: "sasha@mail.ru", password: '333333' },
    { first_name: 'Admin', last_name: 'Adminich', type: 'Admin', email: "admin@mail.ru",
      password: 'admin735' }

  ]
)
tests = Test.create!(
  [
    { title: 'Типы данных Ruby', level: 0,
      author: users[0], category: categories[0] },
    { title: 'ООП Ruby', level: 1,
      author: users[0], category: categories[0] },
    { title: 'Типы данных Javascript', level: 0,
      author: users[0], category: categories[1] },
    { title: 'Операции с массивами Javascript', level: 1,
      author: users[0], category: categories[1] },
    { title: 'HTML тэги', level: 0,
      author: users[0], category: categories[2] },
    { title: 'HTML семантика', level: 3,
      author: users[0], category: categories[2] },
    { title: 'SQL CRUD - операции', level: 1,
      author: users[0], category: categories[3]  },
    { title: 'SQL Join - операции', level: 3,
      author: users[0], category: categories[3]  }
  ]
)
questions = Question.create!(
  [
    { body: 'Тип данных, которого нет в Ruby',
      test: tests[0] },
    { body: 'Как обозначается наследование в Ruby',
      test: tests[0] },
    { body: 'Выберете типы данных, которые есть Javascript',
      test: tests[2] },
    { body: 'Метод массива, который изменяет каждый элемент',
      test: tests[3] },
    { body: 'Назовите тэг, обозначающий параграф',
      test: tests[4] },
    { body: 'Назовите тэг, обозначающий нижний раздел на сайте',
      test: tests[5] },
    { body: 'Команда для удаления элементов из таблицы',
      test: tests[6] },
    { body: 'Какие виды JOIN бывают',
      test: tests[7] }
  ]
)

answers = Answer.create!(
  [
    { body: 'String', correct: false, question: questions[0] },
    { body: 'LinkedList', correct: true, question: questions[0] },
    { body: 'Array', correct: false, question: questions[0] },
    { body: '<', correct: true, question: questions[1] },
    { body: 'extend', correct: false, question: questions[1] },
    { body: 'implement', correct: false, question: questions[1] },
    { body: 'Object', correct: true, question: questions[2] },
    { body: 'Hash', correct: false, question: questions[2] },
    { body: 'Null', correct: true, question: questions[2] },
    { body: 'map', correct: true, question: questions[3] },
    { body: 'filter', correct: false, question: questions[3] },
    { body: 'reduce', correct: false, question: questions[3] },
    { body: '<br>', correct: false, question: questions[4] },
    { body: '<a>', correct: false, question: questions[4] },
    { body: '<p>', correct: true, question: questions[4] },
    { body: '<body>', correct: false, question: questions[5] },
    { body: '<footer>', correct: true, question: questions[5] },
    { body: '<header>', correct: false, question: questions[5] },
    { body: 'DROP', correct: false, question: questions[6] },
    { body: 'DELETE', correct: true, question: questions[6] },
    { body: 'REMOVE', correct: false, question: questions[6] },
    { body: 'LEFT JOIN', correct: true, question: questions[7] },
    { body: 'RIGHT JOIN', correct: true, question: questions[7] },
    { body: 'TOP JOIN', correct: false, question: questions[7] }
  ]
)

results = Result.create!(
  [
    { user: users[0], test: tests[0] },
    { user: users[0], test: tests[4] },
    { user: users[1], test: tests[0] },
    { user: users[1], test: tests[6] },
    { user: users[1], test: tests[7] },
    { user: users[2], test: tests[2] },
    { user: users[2], test: tests[3] },
    { user: users[2], test: tests[4] }
  ]
)
