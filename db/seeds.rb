lindsay = User.create!(name: 'Lindsay Kelly', email: 'lindsay@mail.com', password: 'password', location: 'Brooklyn')
matt = User.create!(name: 'Matt Critelli', email: 'matthew@mail.com', password: 'password', location: 'Brooklyn')
miles = User.create!(name: 'Miles McSomething', email: 'runningmiles@mail.com', password: 'password', location: 'Financial District')
meow = User.create!(name: 'Catherine Khuu', email: 'catherine@mail.com', password: 'password', location: 'The Heights')

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

Run.create!(distance: 3.75, run_time: more_time, run_pace: converted_pace(even_more_seconds, 3.75), runner_id: 1, is_complete: true)

even_more_time = 3600
cat_time = Time.at(even_more_time).utc.strftime('%H:%M:%S')

Run.create!(distance: 9.08, run_time: cat_time, run_pace: converted_pace(even_more_time, 9.08), runner_id: 2, companion_id: 3, is_solo: false, is_complete: true)

miles_seconds = 3720
miles_time = Time.at(miles_seconds).utc.strftime('%H:%M:%S')

Run.create!(distance: 9.5, run_time: miles_time, run_pace: converted_pace(miles_seconds, 9.5), runner_id: 3, companion_id: 2, is_solo: false, is_complete: true)

the_seconds = 900
overall_time = Time.at(the_seconds).utc.strftime('%H:%M:%S')

Run.create!(distance: 3, run_time: overall_time, run_pace: converted_pace(the_seconds, 3), runner_id: 4)
