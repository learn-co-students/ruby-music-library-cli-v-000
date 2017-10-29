class Artist
  extend Concerns::Findable
  extend Concerns::Createdestroy
  include Concerns::Save
  attr_accessor :name, :song, :songs, :genres

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
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
