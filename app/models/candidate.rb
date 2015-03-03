class Candidate < ActiveRecord::Base
  has_many :votes
  belongs_to :race
  validates :name, presence: true
  validates :party, presence: true

  def as_json(options = {})
    { name: name, vote_count: votes.count }
  end


end
