# users
users = User.create([
  { nickname: "davis.schuster", email: "eden@smith.us" },
  { nickname: "traci.white", email: "brittny@boscorodriguez.name" },
  { nickname: "coy", email: "leonarda@marvin.name" },
  { nickname: "zane.lind", email: "hailey@cassinbrekke.com" },
  { nickname: "jackeline.dickens", email: "tresa@leschharvey.ca" },
  { nickname: "eleanor_vandervort", email: "lovie.pollich@wolf.name" },
])

# categories
categories = Category.create([
  { title: "Frontend develop" },
  { title: "Backend develop" },
  { title: "Mobile develop" },
])

# test
tests = Test.create([
  { title: "Test 1", level: rand(5), category: categories.sample },
  { title: "Test 2", level: rand(5), category: categories.sample },
  { title: "Test 3", level: rand(5), category: categories.sample },
  { title: "Test 4", level: rand(5), category: categories.sample },
  { title: "Test 5", level: rand(5), category: categories.sample },
])

# questions
questions = []
tests.each do |test|
  4.times do |i|
    questions << test.questions.create(body: "Вопрос #{i}")
  end
end

# answers
questions.each do |question|
  4.times do |i|
    question.answers.create(body: "Ответ #{i}")
  end
end

# add tests to users
users.each do |user|
  3.times do
    user.tests << tests.sample
  end
end
