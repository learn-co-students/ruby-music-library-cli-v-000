class Artist
  extend Concerns::Findable
  attr_accessor :name, :song, :songs, :genres
    @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    Artist.all.clear
  end

  def self.create(name)
    name = Artist.new(name)
    name.save
    name
  end

  def save
    Artist.all << self
  end

  def add_song(song)
    self.song = song
    if song.artist != self # <-- if artist is not added to the song then add to the song instance
      song.artist = self
      self.songs << song if !self.songs.include?(song) # <-- if the song is not included in the Artists#songs array then add it
    elsif !self.songs.include?(song)
      self.songs << song
    end
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq
  end
end
