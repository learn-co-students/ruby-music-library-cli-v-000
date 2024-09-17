class Artist

  attr_accessor :name

  extend Concerns::Findable

  @@all = []

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

  def save
  	self.class.all << self
  end

  def self.create(name)
  	artist = self.new(name)
  	self.all << artist
  	artist
  end

  def songs
  	@songs
  end

  def add_song(song)
  	self.songs << song unless self.songs.include?(song)
  	song.artist = self unless song.artist.class == self.class
  end

  def genres
  	self.songs.collect {|song| song.genre}.uniq
  end

end