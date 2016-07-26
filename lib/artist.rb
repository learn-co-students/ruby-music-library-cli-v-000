class Artist
  @@all = []
  attr_accessor :name, :songs
  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
  end

  def add_song(song)
    self.songs << song unless self.songs.include? song
    if song.artist != self
      song.artist = self
    end
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end
end
