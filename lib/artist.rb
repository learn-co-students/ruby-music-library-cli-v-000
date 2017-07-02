class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  
  @@all = []

  attr_accessor :name

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @song = []
  end

  def self.create(name)
    new(name).tap{|art| art.save}
  end

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def genres
    self.songs.collect{|s| s.genre}.uniq
  end

  def to_s
    self.name
  end

  def save
    @@all << self
  end

end
