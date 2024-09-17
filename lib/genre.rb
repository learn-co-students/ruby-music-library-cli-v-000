class Genre

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
    genre = self.new(name)
    self.all << genre
    genre
  end

  def songs
  	@songs
  end

  def add_song(song)
  	self.songs << song unless self.songs.include?(song)
    song.genre = self unless song.genre.class == self.class
  end


  def artists
  	self.songs.collect {|song| song.artist}.uniq
  end
end