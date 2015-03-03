# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



ApiKey.create

parties = ["Democrat", "Republican"]
100.times do
  Voter.create(name: Faker::Name.name, party: parties.sample )
end

voters = Voter.all

rand(10..15).times do
  starts = DateTime.now - rand(5..10).days
  ends   = DateTime.now + rand(5..10).days

  r = Race.create(start_at: starts, end_at: ends, title: Faker::Company.catch_phrase )

  rand(2..5).times do
    Candidate.create(name: Faker::Name.name, party: parties.sample, race: r )
  end

  candidates = r.candidates

  voters.each do |v|
    Vote.create(candidate: candidates.sample, voter: v, race: r)
  end

end
