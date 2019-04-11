class Genre
  extend Group::ClassMethods
  include Group::InstanceMethods
  extend Concerns::Findable
  attr_accessor :name, :all, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def self.all
    @@all
  end

  def create(name)
    initialize(name)
  end

  def add_song(song)
    # binding.pry
    if song.genre == nil
      song.genre = self
    end

    if !songs.include?(song)
      @songs << song
    end
  end

  def artists
    self.songs.collect{|artist| artist.artist}.uniq
  end

end
