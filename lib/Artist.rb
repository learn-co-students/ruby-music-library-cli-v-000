class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song_name)
    song_name.artist=self  if song_name.artist == ""  #assigns the current artist to the song's 'artist' property (song belongs to artist)

    unless self.songs.include?(song_name)             #does not add the song to the current artist's collection of songs if it already exists therein
      self.songs << song_name                         #adds the song to the current artist's 'songs' collection
    end

    self
  end

  def genres
    self.songs.collect do |song|
      song.genre
    end.uniq
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    Artist.new(name).tap do |artist|
      artist.save
    end
  end
end
