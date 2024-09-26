class Artist

  attr_accessor :name, :songs

  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    new(name).tap {|x| x.save}
  end

  def songs
    @songs
  end

  def genres
    self.songs.collect do |song|
      song.genre
    end.uniq
  end

  def to_s
    self.name
  end
end