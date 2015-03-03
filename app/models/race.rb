class Race < ActiveRecord::Base
  has_many :candidates
  has_many :votes

  def as_json(options = {})
    { title: title, vote_count: votes.count, candidates: candidates }
  end

end
