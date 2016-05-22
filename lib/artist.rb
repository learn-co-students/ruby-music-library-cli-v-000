class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self if song.artist == nil
  end

  def save
    @@all << self
  end

  def genres
    @songs.collect do |song|
      song.genre
    end.uniq
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end


  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

end
