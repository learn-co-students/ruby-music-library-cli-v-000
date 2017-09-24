class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = Array.new

  def initialize(name)
    @name = name
    @songs = Array.new
  end

  def self.create(name)
    new(name).tap{|artist| artist.save}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = Array.new
  end

  def save
    @@all << self
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end
end
