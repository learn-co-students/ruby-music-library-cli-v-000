class Artist

  extend Concerns::Findable
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def add_song(song)
    # if songs.include?(song)
    #   @songs
    # elsif song.artist == self
    #   @songs << song
    # else
    #   @songs << song
    #   song.artist = self
    # end
    song.artist = self unless song.artist
    @songs << song unless songs.include?(song)
  end

  def genres
    genre_array = []
    songs.collect do |song|
      genre_array << song.genre
    end
    genre_array.uniq
  end

end
