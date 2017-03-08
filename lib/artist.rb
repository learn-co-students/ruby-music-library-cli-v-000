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
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(artist)
    this_artist = self.new(artist)
    this_artist.save
    this_artist
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self if !song.artist
    self.songs << song unless self.songs.include? song
  end

  def genres
    genres = []
    self.songs.each do |song|
      genres << song.genre
    end
    genres.uniq
  end

end
