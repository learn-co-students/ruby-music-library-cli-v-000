class Genre
  extend Concerns::Findable
  extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods

  attr_accessor :name, :artist, :song

  @@all = []

  ## initializes with a name
  def initialize(name)
    @name = name
    @songs = []
  end # initialize


  ## returns the class variable (array)
  def self.all
    @@all
  end # self.all

  ###################################################################
  ###### artist.rb, genre.rb, song.rb code differs here on out ######
  ###################################################################

  # returns the contents of @array, containing all the songs in this genre
  def songs
    @songs
  end #songs

  # add & associates the song to this genre
  def add_song(song)
    if !self.songs.include?(song)
      self.songs << song
    end

    if song.genre == nil
      song.genre = self
    end
  end # add_song

  # returns the collection of artists associated with this genre (without repetition)
  def artists
    self.songs.collect {|song| song.artist}.uniq
  end # artists

end # class Genre
