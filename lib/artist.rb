
class Artist

  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :songs
  @@all = [ ]

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new(name).tap{|artist| artist.save}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end

#  def songs
#    @songs
#  end

  def genres
    self.songs.collect{|s| s.genre}.uniq
  end

  #def to_s
  # self.name
  #end


end
