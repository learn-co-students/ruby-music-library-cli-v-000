class Artist
  @@all = []
  include Concerns::Findable
  attr_reader :songs

  def self.all
    @@all
  end

  def initialize(name)
    super
  end

  def add_song(song)
    song.artist ||= self
    songs << song unless songs.include?(song)
  end

  def genres
    songs.collect { |song| song.genre }.uniq
  end

end
