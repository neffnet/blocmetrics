# create a test user if not already
u = User.where(username:'test').first_or_create do |u|
  u.username = 'test'
  u.password = 'hello'
  u.password_confirmation = 'hello'
  u.email = 'test@example.com'

  u.skip_confirmation!
  u.save
end

# give test user some applications
4.times do
  new_domain = Faker::Internet.domain_word
  u.domains.create(
    name: new_domain,
    url: new_domain + '.com'
  )
end

# give test user's domains some events
events = ['foo','bar','klik','spizz']
30.times do
  d = u.domains.sample
  e = events.sample
  d.events.create(name: e)
end

puts "seed complete, test user has #{u.domains.length} domains"

