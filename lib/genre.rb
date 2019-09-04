#Genre class
class Genre
  attr_accessor :name, :songs
  include SongArtists::InstanceMethods
  extend SongArtists::ClassMethods
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  # def songs=(song)
  #   if !@songs.include?(song)
  #     @songs<<song
  #   end
  # end

  def artists
    artists_array = self.songs.collect{|song|song.artist}
    artists_array.uniq
  end
end
