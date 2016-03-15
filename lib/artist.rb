class Artist
  extend Concerns::CommonUtil
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    song.artist ||= self
    @songs << song unless @songs.include? song
  end

  def genres
    @songs.map {|song| song.genre}.uniq
  end

  def save
    Artist.all << self
    self
  end

  def self.create(name)
    new(name).tap(&:save)
  end

  def self.all
    @@all
  end
end