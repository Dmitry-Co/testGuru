# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Удаление данных
# Answer.destroy_all
# Question.destroy_all
# Test.destroy_all
# User.destroy_all
# Category.destroy_all

# Создание категорий
history = Category.create!(title:   'История')
science = Category.create!(title:   'Наука')
geography = Category.create!(title: 'География')

# Создание пользователей
user1 = User.create!(name: 'User1', email: 'user1@example.com')
user2 = User.create!(name: 'User2', email: 'user2@example.com')
user3 = User.create!(name: 'User3', email: 'user3@example.com')

# Создание тестов и связи с категориями и пользователями
hist_test = user1.tests.create!(title: 'История', level: 1, category: history)
sci_test = user2.tests.create!(title: 'Наука', level: 2, category: science)
geo_test = user3.tests.create!(title: 'География', level: 3, category: geography)

# Создание вопросов и связи с тестами
hist_q1 = hist_test.questions.create!(body: 'Какие древние цивилизации существовали в Месопотамии?')
hist_q2 = hist_test.questions.create!(body: 'Кто был римским завоевателем, властителем Рима?')
hist_q3 = hist_test.questions.create!(body: 'Что стало причиной краха Римской империи?')

sci_q1 = sci_test.questions.create!(body: 'Что означает закон сохранения энергии в физике?')
sci_q2 = sci_test.questions.create!(body: 'Что изучает астрономия?')
sci_q3 = sci_test.questions.create!(body: 'Что такое электромагнитное поле в физике?')

geo_q1 = geo_test.questions.create!(body: 'Какой остров считается крупнейшим в мире?')
geo_q2 = geo_test.questions.create!(body: 'Какое озеро считается самым глубоким на планете?')
geo_q3 = geo_test.questions.create!(body: 'Какой континент считается самым холодным?')

# Создание ответов и связи с вопросами
hist_q1.answers.create!(body: 'Плутон, Аврелий, Масрон', correct: false)
hist_q1.answers.create!(body: 'Сумер, Аккад, Вавилон', correct: true)
hist_q1.answers.create!(body: 'Верона, Марел, Теонор', correct: false)
hist_q1.answers.create!(body: 'Мардор, Велоран, Диксон', correct: false)

hist_q2.answers.create!(body: 'Юлий Цезарь', correct: true)
hist_q3.answers.create!(body: 'Экономический и социальный кризис', correct: true)

sci_q1.answers.create!(body: 'Энергия не может быть создана или уничтожена, только преобразована', correct: true)
sci_q2.answers.create!(body: 'Небесные объекты, звезды, планеты и их движение', correct: true)
sci_q3.answers.create!(body: 'Силовое поле, создаваемое взаимодействием заряженных частиц', correct: true)

geo_q1.answers.create!(body: 'Гренландия', correct: true)
geo_q2.answers.create!(body: 'Озеро Байкал', correct: true)
geo_q3.answers.create!(body: 'Антарктида', correct: true)
