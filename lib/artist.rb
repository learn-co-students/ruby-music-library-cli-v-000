class Artist
  extend Concerns::Findable
  @@all = []
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end

  def save
   @@all << self unless @@all.include?(self)
  end

  def genres
    self.songs.collect {|song| song.genre }.uniq
  end

end
