# users

admin = Admin.create(first_name: 'admin',
                      last_name: 'admin',
                      email: 'admtestguru@rambler.ru',
                      password: Rails.application.credentials.admin[:password],
                      password_confirmation: Rails.application.credentials.admin[:password] )

# categories
categories = Category.create([
  { title: "Литератора" },
  { title: "Математика" },
  { title: "Информатика" },
])

# test
test = Test.create(title: "Тест «Биография Баратынского»", level: rand(5), category: categories[0], author: admin)

question = test.questions.create(body: "В каком году родился Евгений Абрамович Баратынский?")
question.answers.create(body: "1800", correct: true)
question.answers.create(body: "1815")
question.answers.create(body: "1823")
question.answers.create(body: "1834")

question = test.questions.create(body: "К какому сословию принадлежала семья Евгения Баратынского?")
question.answers.create(body: "Духовенство")
question.answers.create(body: "Дворяне", correct: true)
question.answers.create(body: "Мещане")
question.answers.create(body: "Крестьяне")

question = test.questions.create(body: "Каким иностранным языком в совершенстве владел Евгений Баратынский?")
question.answers.create(body: "Итальянский")
question.answers.create(body: "Немецкий")
question.answers.create(body: "Французский")
question.answers.create(body: "Все ответы верны", correct: true)

question = test.questions.create(body: "Кем мечтал стать в юности Евгений Баратынский?")
question.answers.create(body: "Поэтом")
question.answers.create(body: "Военным", correct: true)
question.answers.create(body: "Дипломатом")
question.answers.create(body: "Придворным музыкантом")

test = Test.create(title: "Тест Выражения с переменными", level: rand(5), category: categories[1], author: admin)

question = test.questions.create(body: 'Решите уравнение -4х + 3 = 6х + 5')

question.answers.create(body: '1')
question.answers.create(body: '4')
question.answers.create(body: '-0,2', correct: true)
question.answers.create(body: '-0,8')

question = test.questions.create(body: 'Найдите корни уравнения -6(3 - х) = 2х + 4(х - 4)')

question.answers.create(body: 'уравнение не имеет корней', correct: true)
question.answers.create(body: '-1/6')
question.answers.create(body: 'х - любое число')
question.answers.create(body: '4')

question = test.questions.create(body: 'Какому неравенству удовлетворяет корень уравнения -15x -7 = 0?')

question.answers.create(body: 'x>0')
question.answers.create(body: 'x<-1')
question.answers.create(body: 'x>-1', correct: true)
question.answers.create(body: 'x<-2')

question = test.questions.create(body: 'При каком значении х значение выражения 14х - 2 в два раза больше значения выражения 5х + 5?')

question.answers.create(body: '3', correct: true)
question.answers.create(body: '-3')
question.answers.create(body: '-0,5')
question.answers.create(body: '0,5')

test = Test.create(title: "Тест на тему “Измерение информации”", level: rand(5), category: categories[2], author: admin)

question = test.questions.create(body: 'Минимальной единицей информации является:')

question.answers.create(body: 'Байт')
question.answers.create(body: 'Бит', correct: true)
question.answers.create(body: 'Знак')
question.answers.create(body: 'Пиксель')

question = test.questions.create(body: 'Один байт равен:')

question.answers.create(body: '2 бит')
question.answers.create(body: '8 бит', correct: true)
question.answers.create(body: '256 бит')
question.answers.create(body: '1024 бит')

question = test.questions.create(body: 'Объем информационного сообщения «Краткость – сестра таланта», в котором вес каждого символа составляет 1 байт, равен (без учета кавычек):')

question.answers.create(body: '26 бит')
question.answers.create(body: '208 бит', correct: true)
question.answers.create(body: '256 бит')
question.answers.create(body: '208 байт')

question = test.questions.create(body: 'Количество символов в алфавите называется:')

question.answers.create(body: 'Объемом')
question.answers.create(body: 'Мощностью', correct: true)
question.answers.create(body: 'Весом')
question.answers.create(body: 'Силой')