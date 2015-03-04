class Race < ActiveRecord::Base
  has_many :candidates
  has_many :votes

  def as_json(options = {})
    { title: title, vote_count: votes.count,
      time_remaining: display_remaining_time,
      candidates: candidates
      }
  end

  def open?
    DateTime.now < self.end_at
  end

  private def display_remaining_time
    time_passed
  end

  def time_passed
    difference = self.end_at - DateTime.now
    [:day, :hour, :minute].each do |unit|
      if difference >= 1.send(unit)
        time = (difference / 1.send(unit)).round
        return "#{time} #{unit}#{time==1 ? '' : 's'} remaining"
      end
    end
    return "#{difference} seconds remaining"
  end
end
