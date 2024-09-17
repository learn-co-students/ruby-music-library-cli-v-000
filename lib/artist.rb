class Artist
  attr_accessor :name, :songs
  @@all = []

  extend Concerns::Findable

  def initialize(name)
    @name = name
    self.save
    @songs = []
  end

  def add_song(song)
    if song.artist.object_id != self.object_id
      song.artist = self
    end
    if !self.songs.include?(song)
      self.songs << song
    end
    song
  end

  def self.create(name)
    artist = self.new(name)
    artist
  end

  def self.all
    @@all
  end

  def genres
    genres = []
    self.songs.each do |song|
      genres << song.genre
    end
    genres.uniq
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    all.clear
  end
end
