class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def add_song(song)
    # song = Song.new(song_name)
    # song.save
    song.genre = self unless song.genre == self
    @songs << song unless @songs.include?(song)
  end

  def self.all # class method
    @@all
  end

  def self.destroy_all 
    @@all.clear
  end

  def artists
    self.songs.collect{|s| s.artist}.uniq
  end
end