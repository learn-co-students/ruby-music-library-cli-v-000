class Artist

  extend Concerns::Findable
    # extends the Concerns::Findable module


  attr_accessor :name
    # retrieves the name of an artist
    # can set the name of an artist
  attr_reader :songs
    # returns the artist's 'songs' collection (artist has many songs)

  @@all = []
   #  is initialized as an empty array
   # (it goes outside of initialize because of @@, which makes it a class array)

  def initialize(name)
    @name = name
      # accepts a name for the new artist
    @songs = []
      # creates a 'songs' property set to an empty array (artist has many songs)
  end

  def self.all
    @@all
      # resets the @@all class variable to an empty array
  end

  def save
    self.class.all << self
      # adds the Artist instance to the @@all class variable
  end

  def self.create(name)
    artist = new(name) #initializes here by using new
    artist.save #saves the name to the arist
    artist #call the artist
      # initializes and saves the artist
  end

  def self.destroy_all
    all.clear
      # resets the @@all class variable to an empty array
  end

  def add_song(song)
    songs << song unless songs.include?(song)
    song.artist = self unless song.artist
      # assigns the current artist to the song's 'artist' property (song belongs to artist)
      # does not assign the artist if the song already has an artist
      # adds the song to the current artist's 'songs' collection
      # does not add the song to the current artist's collection of songs if it already exists therein
  end

  def genres
    songs.collect {|song| song.genre }.uniq
        # returns a collection of genres for all of the artist's songs
        # => (artist has many genres through songs)
        # does not return duplicate genres if the artist has more than one song of a particular genre
        # => (artist has many genres through songs)
        # collects genres through its songs instead of maintaining its own @genres instance variable
        # => (artist has many genres through songs)
  end

end
