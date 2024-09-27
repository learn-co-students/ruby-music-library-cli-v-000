class Artist

  extend Concerns::Findable

  #name retrieves the name of a artist, name= can set the name of a artist
  #songs returns the artist's 'songs' collection

  attr_accessor :name, :songs

  #@@all is initialized as an empty array

  @@all = []

  #initialize accepts a name for the new artist, #Artist #initialize creates a 'songs' property set to an empty array

  def initialize(name)
    @name = name
    @songs = []
  end

  #.all returns the class variable @@all

  def self.all
    @@all
  end

  #.destroy_all resets the @@all class variable to an empty array

  def self.destroy_all
    self.all.clear
  end

  #save adds the artist instance to the @@all class variable

  def save
    @@all << self
  end

  #.create initializes and saves the artist

  def self.create(name)
    new_artist = Artist.new(name).tap do |artist|
      artist.save
    end
  end

  # assigns the current artist to the song's 'artist' property (song belongs to artist)
  # does not assign the artist if the song already has an artist
  # adds the song to the current artist's 'songs' collection
  # does not add the song to the current artist's collection of songs if it already exists therein

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include? song
  end

  # #genres returns a collection of genres for all of the artist's songs (artist has many genres through songs)
  # #genres return duplicate genres if the artist has more than one song of a particular genre (artist has many genres through songs)

  def genres
    self.songs.collect {|song| (song.genre) }.uniq
  end

end
