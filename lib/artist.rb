class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
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

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  #instance methods
  def save
    @@all << self
  end

  def add_song(song)
    if song.artist.nil? then song.artist = self end
    if self.songs.include?(song)
    else
      @songs << song
    end
  end

  def songs
    @songs
  end

  def genres
    every_genre = self.songs.collect {|song| song.genre}
    every_genre.uniq
  end

end
