class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new(name).tap {|i| i.save}
  end

  def self.destroy_all
    @@all.clear
  end


  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def genres
    self.songs.collect { |i| i.genre }.uniq
  end

end
