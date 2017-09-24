class Artist
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
	@name = name
  @songs = []
  end

  def self.all
	@@all
  end

  def self.destroy_all
  	all.clear
  end

  def save
  	@@all << self
  end

  def self.create(name)
  	artist = Artist.new(name)
  	artist.save
  	artist
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def songs
    @songs
  end

  def genres
    genre = songs.collect {|song| song.genre}
    genre.uniq
  end

  def to_s
    "#{name}"
  end

end	