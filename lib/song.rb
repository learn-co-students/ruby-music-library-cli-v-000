require 'pry'

class Song
  extend Concerns::Findable
  extend Concerns::Save::ClassMethods
  include Concerns::Save::InstanceMethods
  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist= artist unless !artist
    self.genre= genre unless !genre
  end

  def artist=(artist)
      @artist = artist unless !!@artist
      artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
end
