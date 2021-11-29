# users
[
  { nickname: "davis.schuster", email: "eden@smith.us" },
  { nickname: "traci.white", email: "brittny@boscorodriguez.name" },
  { nickname: "coy", email: "leonarda@marvin.name" },
  { nickname: "zane.lind", email: "hailey@cassinbrekke.com" },
  { nickname: "jackeline.dickens", email: "tresa@leschharvey.ca" },
  { nickname: "eleanor_vandervort", email: "lovie.pollich@wolf.name" }
].each do |user|
  User.create(user)
end

# categories
[
  {title: "Frontend develop"},
  {title: "Backend develop"},
  {title: "Mobile develop"}
].each do |category|
  Category.create(category)
end

# test
[
  {title: "Test 1", level: rand(5), category: Category.order(Arel.sql('RANDOM()')).first},
  {title: "Test 2", level: rand(5), category: Category.order(Arel.sql('RANDOM()')).first},
  {title: "Test 3", level: rand(5), category: Category.order(Arel.sql('RANDOM()')).first},
  {title: "Test 4", level: rand(5), category: Category.order(Arel.sql('RANDOM()')).first},
  {title: "Test 5", level: rand(5), category: Category.order(Arel.sql('RANDOM()')).first}
].each do |test|
  Test.create(test)
end

# questions
Test.all.each do |test|
  4.times do |i|
    test.questions.create(body: "Вопрос #{i}")
  end
end

# answers
Question.all.each do |question|
  4.times do |i|
    question.answers.create(body: "Ответ #{i}")
  end
end

# add tests to users
User.all.each do |user|
  3.times do
    user.tests << Test.order(Arel.sql('RANDOM()')).first
  end
end

