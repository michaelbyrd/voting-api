class Candidate < ActiveRecord::Base
  has_many :votes
  belongs_to :race
  validates :name, presence: true
  validates :party, presence: true
end
