class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def self.find_by_name(name)
    @@all.detect {|artist| artist.name == name}
  end

  def add_song(song)
    if @songs.include?(song) == false
      @songs << song
    end

    if !song.artist
      song.artist = self
    end
  end

end
