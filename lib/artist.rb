class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs #returns the artist's 'songs' collection

  @@all = []  #@@all is initialized as an empty array

  def initialize(name) #accepts a name for the new artist
    @name = name  #@name = name property
    @songs = [] #creates a 'songs' property set to an empy array (artist has many songs)
  end

  def genres  #returns a collection of genres for all of the artist's songs(artis has many songs through a song)
    songs.collect {|song| song.genre}.uniq  #.uniq-does not return duplicate genres if the artis has more than one song of a particular genre(a artis has manhy genres through songs)
  end

  def self.all #returns the class variable @@all
    @@all
  end

  def self.destroy_all #resets the @@all class variable to an empty array
    @@all = []
  end

  def save  #adds the artist instance to the @@all class variable
    @@all << self
  end

  def self.create(created_artist) #initializes and saves the artist
      artist = Artist.new(created_artist)
      artist.save
      artist
  end

  def add_song(song)
    #  if song.artist != self #assigns the current artist to the song's 'artist' property (song belongs to artist)
        song.artist = self unless song.artist #does not assign the artist if the song already has an artist
        songs.push song unless songs.include?(song)
  end

end
