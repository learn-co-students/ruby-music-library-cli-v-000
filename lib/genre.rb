class Genre
  extend Concerns::CommonUtil
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name, @songs = name, []
  end

  def add_song(song)
    song.genre ||= self
    @songs << song unless @songs.include? song
  end

  def artists
    @songs.map {|song| song.artist}.uniq
  end

  def save
    Genre.all << self
  end

  def self.create(name)
    new(name).tap(&:save)
  end

  def self.all
    @@all
  end
end