class Genre
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

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def save
    @@all << self
  end

  def add_song(song)
    if song.genre == nil
      song.genre = self
    end
    if self.songs.none? {|s| s == song}
      self.songs << song
    end
  end

  def artists
    artist_array = self.songs.collect {|s| s.artist}
    artist_array.uniq
  end

end
