class Vote < ActiveRecord::Base
  belongs_to :voter
  belongs_to :candidate


  def as_json(options = {})
    { voter: voter.name, candidate: candidate.name }
  end
end
