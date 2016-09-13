class Artist

  extend Concerns::Findable
  
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def add_song(song)
    if self.songs.include?(song) == false
    @songs << song
    end
    if song.artist.nil?
    song.artist = self
    end
  end

  def genres
    arr = self.songs.collect {|song| song.genre}
    arr.uniq
  end
end
