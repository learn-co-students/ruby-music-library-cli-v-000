class Artist
  attr_accessor :name, :songs
  @@all = []

  extend Concerns::Findable

  ### INSTANTIATION METHODS ###
  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  ### CLASS METHODS ###
  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  ### INSTANCE METHODS ###
  def save
    self.class.all << self
  end

  def add_song(song)
    unless self.songs.include?(song)
      self.songs << song
    end
    unless song.artist
      song.artist = self
    end
  end

  def genres
    genres = self.songs.collect {|song| song.genre}
    genres.uniq
  end

end
