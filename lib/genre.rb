class Genre
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
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

  #adds the song to the genre's collection and assigns the genre to the song
  def add_song(song)
    #adds the song to the genre's collection if it doesn't already exist
    @songs << song if @songs.include?(song) == false
    #assigns the genre to the song if the song doesn't already have an artist
    song.genre = self if song.genre == nil
  end

  #identifies the collection of artists's associated with an genre's song collection
  def artists
    @songs.collect{|song| song.artist}.uniq
  end
end
