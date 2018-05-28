class Artist

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  # Class Methods

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
    artist = Artist.new(name)
    artist.save
    artist
  end

  # Instance Methods

  def songs
    @songs
  end

  # def add_song(song)
  #   unless (song.artist && songs.include?(song))
  #     song.artist = self
  #     self.songs << song
  #   end
  # end

  def add_song(song)
    if !song.artist
      song.artist = self
    end

    if !songs.include?(song)
      songs << song
    end
  end

end
