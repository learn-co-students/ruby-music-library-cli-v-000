class Artist
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    new(name).tap{|s| s.save}
  end

  def add_song(song)
    @songs << song
  end

  def add_song(song)
     song.artist = self unless song.artist == self
     @songs << song unless @songs.include?(song)
   end

   def genres
    self.songs.collect{|s| s.genre}.uniq
  end

  def to_s
    self.name
  end

end
