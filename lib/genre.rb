class Genre

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
    # elsif song.genre == self
    #   @songs << song
    # else
    #   @songs << song
    #   song.genre = self
    # end
    song.genre = self unless song.genre
    @songs << song unless songs.include?(song)
  end

  def artists
    artist_array = []
    songs.collect do |song|
      artist_array << song.artist
    end
    artist_array.uniq
  end



end
