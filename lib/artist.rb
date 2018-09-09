class Artist
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

  #adds the song to the artist's collection and assigns the artist to the song
  def add_song(song)
    @songs << song if @songs.include?(song) == false #adds the song to the artist's collection if it doesn't already exist
    song.artist = self if song.artist == nil #assigns the artist to the song if the song doesn't already have an artist
  end

  #identifies the collection of genre's associated with an artist's song collection
  def genres
    @songs.collect{|song| song.genre}.uniq
  end
end
