


class Artist

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

  def save
    @@all << self
  end

  def self.create(name)
    Artist.new(name).save
    self
  end

  def self.destroy_all
    @@all = []
  end

  def songs
    @songs
  end

  def add_song(song)
    if !(@songs.include?song)
      @songs << song
      song.artist = self
    end
  end

  def genres
    collection_array = @songs.collect { |song| song.genre}
    collection_array.uniq
  end

  def self.create(name)
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end

  def self.new_from_filename(filename)
    new_song = self.new
    new_song.save
    new_song
  end

end
