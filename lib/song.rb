class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def artist=(artist)
    artist.add_song(self) unless artist.songs.include?(self)
    @artist = artist
  end

  def genre=(genre)
    genre.songs << self unless genre.songs.include?(self)
    @genre = genre
  end

  def save
    @@all << self
  end

  def self.create(name)
    Song.new(name).tap{|new_song| new_song.save}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

end
