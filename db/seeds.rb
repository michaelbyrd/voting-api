# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

parties = ["Democrat", "Republican"]
20.times do
  Candidate.create(name: Faker::Name.name, party: parties.sample )
end


20.times do
  Voter.create(name: Faker::Name.name, party: parties.sample )
end


voters = Voter.all
candidates = Candidate.all
voters.each do |v|
  Vote.create(candidate: candidates.sample, voter: v)
end
