class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs
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
    @@all.clear
  end

  def genres
    @songs.collect do |song|
      song.genre
    end.uniq
  end

  def save
    @@all << self
  end

  def self.create(name)
    new(name).tap{|art| art.save}
  end

end