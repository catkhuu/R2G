lindsay = User.create!(name: 'Lindsay Kelly', email: 'lindsay@mail.com', password: 'password', location: 'Brooklyn', password_confirmation: 'password')
matt = User.create!(name: 'Matt Critelli', email: 'matthew@mail.com', password: 'password', location: 'Brooklyn', password_confirmation: 'password')
miles = User.create!(name: 'Miles McSomething', email: 'runningmiles@mail.com', password: 'password', location: 'Financial District', password_confirmation: 'password')
meow = User.create!(name: 'Catherine Khuu', email: 'catherine@mail.com', password: 'password', location: 'The Heights', password_confirmation: 'password')

seconds = 240
pace = Time.at(seconds).utc.strftime('%H:%M:%S')

Profile.create!(why_i_run: 'To get away from people', user_pace: pace, experience: 'Beginner', user: lindsay, goals: 'to be the very best like no one ever was', need_to_knows: 'destroyed meniscus')

Profile.create!(why_i_run: 'To challenge myself', user_pace: pace, experience: 'Intermediate', user: matt, goals: 'to compete in the Iron Man Triathlon with my dog')

Profile.create!(why_i_run: 'To stay fit', user_pace: pace, experience: 'Competitive', user: miles, goals: 'to compete in the Iron Man Triathlon with my cat')

Profile.create!(why_i_run: 'To relax and find some peace of mind', user_pace: pace, experience: 'Intermediate', user: meow, goals: 'to qualify for the Berlin Marathon in 2017', need_to_knows: 'I will stop if there is a corgi or any dog ')

more_seconds = 480
more_pace = Time.at(more_seconds).utc.strftime('%H:%M:%S')

Mood.create!(name: 'The afternoon special', mood_pace: more_pace, mood_experience: 'Beginner', desired_distance: 4, user: lindsay)

Mood.create!(name: 'Saucy', mood_experience: 'Competitive', user: matt)

Mood.create!(name: 'Many the Miles', desired_distance: 10, user: miles)

Mood.create!(name: 'Brisk', desired_distance: 3.5, user: meow)

even_more_seconds = 1500
more_time = Time.at(even_more_seconds).utc.strftime('%H:%M:%S')

def converted_pace(seconds, distance)
  pace_seconds = seconds/distance
  Time.at(pace_seconds).utc.strftime('%H:%M:%S')
end

Run.create!(runner_id: 1, run_date: "30 November, 2016", time: 43200, zipcode: 10004)
Run.create!(runner_id: 2, run_date: "29 November, 2016", time: 48000, zipcode: 10004)
Run.create!(runner_id: 3, run_date: "29 November, 2016", time: 48000, zipcode: 10004)
Run.create!(runner_id: 4, run_date: "28 November, 2016", time: 43200, zipcode: 10004)
