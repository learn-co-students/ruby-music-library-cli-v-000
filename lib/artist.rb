class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    Artist.new(name).tap do |new_artist|
      new_artist.save
    end
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def save
    @@all << self
  end

  def genres
    outs = self.songs.collect do |song|
      song.genre
    end
    outs.uniq
  end
end
