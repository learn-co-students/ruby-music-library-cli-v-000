class Artist

  extend Concerns::Findable


  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
      # resets the @@all class variable to an empty array
  end

  def save
    @@all << self
      # adds the Artist instance to the @@all class variable
  end

  def self.create(name)
    artist = new(name)
    artist.save
    artist
      # initializes and saves the artist
  end

  def self.destroy_all
    @@all.clear
  end

  def add_song(song)
    @songs << song unless songs.include?(song)
    song.artist = self unless song.artist
      # assigns the current artist to the song's 'artist' property (song belongs to artist)
      # does not assign the artist if the song already has an artist
      # adds the song to the current artist's 'songs' collection
      # does not add the song to the current artist's collection of songs if it already exists therein
  end

  def genres
    songs.collect {|song| song.genre }.uniq
        # returns a collection of genres for all of the artist's songs (artist has many genres through songs)
        # does not return duplicate genres if the artist has more than one song of a particular genre (artist has many genres through songs)
        # collects genres through its songs instead of maintaining its own @genres instance variable (artist has many genres through songs)
  end

end
