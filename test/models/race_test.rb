require 'test_helper'

class RaceTest < ActiveSupport::TestCase
  test "voters can only vote once per race" do
    race = races(:one)
    voter = Voter.create(name: "Bozo", party: "TheClown")
    
    v1 = Vote.create(race: race, voter: voter, candidate: race.candidates.first)
    v2 = Vote.create(race: race, voter: voter, candidate: race.candidates.first)

    assert v1.valid?
    refute v2.valid?
  end
end
