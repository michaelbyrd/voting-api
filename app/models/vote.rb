class Vote < ActiveRecord::Base
  belongs_to :voter
  belongs_to :candidate
  belongs_to :race

  validates :voter_id, uniqueness: true
  validates :candidate_id, presence: true
  validates :race_id, presence: true

  def as_json(options = {})
    { voter: voter.name, candidate: candidate.name }
  end

  # private def voters_can_vote_once_per_race
  #   if self.race.votes.find_by(voter_id: )
  #    errors.add(:vote, "can't vote twice in the same race")
  #  end
  # end
end
