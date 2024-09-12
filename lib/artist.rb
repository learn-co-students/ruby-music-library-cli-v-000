class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs
#is initialized as an empty array
  @@all = []
#accepts a name for the new artist
  def initialize(name)
    @name = name
#creates songs property set to empty array (artist has many songs)
    @songs = []
  end
#returns the class variable @@all
  def self.all
    @@all
  end
#resets the @@all class variable to an empty array
  def self.destroy_all
    @@all.clear
  end
#adds the Artist instance to the @@all class variable
  def save
    @@all << self
  end
#initializes and saves the artist
  def self.create(name)
    Artist.new(name).tap{ |n| n.save}
  end

  def add_song(song)
#assigns current artist to song's 'artist' property (song belongs to artist), does not add if song already there
    song.artist = self unless song.artist
#adds the song to the current artist's 'songs' collection, does not add if song is already there
    songs << song unless songs.include?(song)
  end
#returns a collection of genres for all of the artist's songs (artist has many songs)
  def genres
#collects genres through its songs instead of maintaining its own @genres instance (artist has many genres through songs), does not return duplicate genres
    songs.collect { |song| song.genre}.uniq
  end

end
