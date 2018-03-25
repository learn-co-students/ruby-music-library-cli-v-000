class Artist
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name).tap {|o| o.save }
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song unless self.songs.include?(song)
    song.artist = self unless song.artist
  end

  def genres
    songs.collect {|s| s.genre}.uniq
  end

#  def self.find_song(name)
#    self.all.detect {|o| o.song == name}
#  end
#
#  def self.create_song(name)
#
#  end
#
#  def self.find_or_create_song(name)
#    self.find_song(name) || self.create(name)
#  end

end
