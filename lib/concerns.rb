module Concerns::Findable

  def self.new_by_name(name, artist = nil, genre = nil)
    song = self.new
    song.name = name
    song
  end

  def self.save
    self.all << self
  end

  def create(name, artist = nil, genre = nil)
    o = self.new(name)
    o.name = name
    o.save
    o
  end

  def find_by_name(name, artist = nil, genre = nil)
    self.all.detect{|o| o.name == name}
  end

  def find_or_create_by_name(name, artist = nil, genre = nil)
      if self.find_by_name(name, artist, genre) == nil
        self.create(name)
      else
        self.find_by_name(name, artist, genre)
      end
  end
end