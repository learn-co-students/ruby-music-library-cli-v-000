class Artist
  attr_accessor :name, :songs
  include SongArtists::InstanceMethods
  extend SongArtists::ClassMethods
  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
  end

  @@all = []

  def self.all
    @@all
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if !self.songs.include?(song)
      self.songs << song
    end
  end

  def genres
    genre_array = self.songs.collect {|song| song.genre}
    genre_array.uniq
  end
end
