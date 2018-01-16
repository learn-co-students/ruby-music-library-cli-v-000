class Artist
  attr_accessor :name, :genre, :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    save
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    name = Artist.new(name)
  end

  def add_song(song)
    if song.artist.nil?
      song.artist = self
    end
    unless songs.include?(song)
      songs << song
     end
  end

  def genres
    array = []
    songs.each do |song|
      array << song.genre
    end
    array.uniq
  end

  def save
    @@all << self
  end
end
