class Genre
  attr_accessor :name, :songs
  @@all = []

  extend Concerns::Findable

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
    self.class.all << self
  end

  def self.create(name)
    new_genre = new(name)
    new_genre.save
    new_genre
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
    song.genre = self unless song.genre
  end

  def artists
    self.songs.collect{|s| s.artist}.uniq
  end

end
