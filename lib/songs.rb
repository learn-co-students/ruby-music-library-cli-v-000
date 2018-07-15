

class Song

  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, artists = nil, genres = nil )
    @name = name
    if artists != nil
      self.artist = artists
    end

    if genres != nil
      self.genre = genres
    end

  end

def artist=(artist)
  @artist = artist
  artist.add_song(self)
end

def genre=(genre)
  @genre = genre
  if !genre.songs.include?(self)
    genre.songs << self
  end
end




end
