class Artist
  extend Concerns::Findable
  extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods

  attr_accessor :name, :song

  @@all = []

  ## initializes with a name
  def initialize(name)
    @name = name
    @songs = []
  end # initialize


  ## returns the contents of the @@all array
  def self.all
    @@all
  end # self.all

  ###################################################################
  ###### artist.rb, genre.rb, song.rb code differs here on out ######
  ###################################################################

  # returns the songs belonging to the instance of the artist
  def songs
    @songs
  end # songs

  # now, I need to be able to create a song and associate it with an artist
  def add_song(song)
    if self.songs.include?(song) == false
      @songs << song
    end

    if song.artist.nil? || song.artist == false
      song.artist = self
    end

  end # add_song

  # returns a collection of genres associated with this artist (without repetition)
  def genres
    self.songs.collect {|song| song.genre}.uniq
  end # genres



end # class Artist
