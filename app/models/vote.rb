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

end
