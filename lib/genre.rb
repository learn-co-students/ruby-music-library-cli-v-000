class Genre
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    unless song.genre
      @songs << song
      song.genre = self
    end
  end

  def artists
    @songs.map { |song| song.artist }.uniq
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

end
