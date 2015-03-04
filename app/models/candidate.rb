class Candidate < ActiveRecord::Base
  has_many :votes
  belongs_to :race
  validates :name, presence: true
  validates :party, presence: true

  def as_json(options = {})
    { name: name, vote_count: votes.count, percent_of_votes: percent_of_votes }
  end

  def percent_of_votes
    count = self.votes.count.to_f
    total = self.race.votes.count.to_f
    if count > 0 && total > 0
      (count / total * 100.00).round(2)
    else
      0.0
    end
  end


end
