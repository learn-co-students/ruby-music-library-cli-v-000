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
    #adds the song to the artist's collection if it doesn't already exist
    @songs << song if @songs.include?(song) == false
    #assigns the artist to the song if the song doesn't already have an artist
    song.artist = self if song.artist == nil
  end

  #identifies the collection of genre's associated with an artist's song collection
  def genres
    @genres = []
    @songs.each do |song|
      @genres << song.genre if @genres.detect{|g| g == song.genre} == nil
    end
    @genres
  end
end
