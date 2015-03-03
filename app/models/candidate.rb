class Candidate < ActiveRecord::Base
  has_many :votes
  belongs_to :race
  validates :name, presence: true
  validates :party, presence: true

  def as_json(options = {})
    { name: name, vote_count: votes.count, percent_of_votes: percent_of_votes.round(2) }
  end

  def percent_of_votes
    count = self.votes.count.to_f
    total = self.race.votes.count.to_f
    count / total * 100.00
  end


end
