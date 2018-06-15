module Concerns::Findable

  def self.find_by_name(song)
    @@all.detect do |x|
      x.name == song
    end
  end

end
