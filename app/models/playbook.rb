class Playbook < ApplicationRecord
  belongs_to :booking
  has_many :playlines
  has_many :song_choices

  def colored_playline_state
    count = self.playlines.count
    if count == 0
      "red"
    elsif count > 10
      "green"
    else
      "orange"
    end
  end

  def colored_music_state
    count = self.song_choices.count
    if count == 0
      "red"
    elsif count >= 3
      "green"
    else
      "orange"
    end
  end
end

class Decorator

  def initialize(component)
    @component = component
  end

  def decorated
    @component
  end


end





















