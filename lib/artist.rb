class Artist
  attr_accessor :name, :songs
  @@all = []

  extend Concerns::Findable
  
  def initialize(name)
    self.name = name
    self.songs = []
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
    Artist.new(name).tap do |artist|
      artist.save
    end
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
    song.artist = self if song.artist.nil?
  end

  def genres
    genres = []
    self.songs.each do |song|
      genres << song.genre unless genres.include?(song.genre)
    end
    genres
  end

end
