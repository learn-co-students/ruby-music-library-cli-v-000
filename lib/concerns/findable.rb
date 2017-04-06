module Concerns::Findable

  def self.find_by_name(name)
    self.all.detect do |i|
      i.name == name
    end
    # finds an instance in @@all by the name property of the song, artist or genre
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  # finds or creates a song by name maintaining uniqueness of objects by their name property
end
