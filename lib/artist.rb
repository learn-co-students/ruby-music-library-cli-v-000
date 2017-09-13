class Artist

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = [] #creates a 'songs' property set to an empty array (artist has many songs)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name) #creates new instances
    new_artist = new(name)
    new_artist.save #invokes .save on that instance
    new_artist
  end

#relationships with class Song
  #Songs belong to an artist and an artist has many songs.

  def add_song(song) #Adding a song to an artist by called add_song on Artist class
    song.artist = self unless song.artist #assigns the current artist (self) to the song's 'artist' property (song belongs to artist), BUT/UNLESS does not assign the artist if the song already has an artist
    songs << song unless songs.include?(song) #adds the song to the current artist's 'songs' collection (@songs array) BUT/UNLESS does not add the song to the current artist's collection of songs IF it already exists therein
  end

#relationships with class Genre
  # Artists have many genres through their songs. Implement a #genres method for this association.

  def genres #returns a collection of genres for all of the artist's songs (artist has many genres through songs)
    #does not return duplicate genres if the artist has more than one song of a particular genre (artist has many genres through songs)
    #collects genres through its songs instead of maintaining its own @genres instance variable (artist has many genres through songs)
    songs.collect do |the_song|
      the_song.genre
    end.uniq
  end

end
