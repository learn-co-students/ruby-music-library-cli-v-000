class Artist
    extend Concerns::Findable 
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
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    a = self.new(name)
    a.save
    a
  end

  def add_song(song)
    if songs.include?(song)
      songs
    else songs << song
    end
          song.artist = self unless song.artist == self

  end

  def genres
    g = []
    self.songs.each do  |song| 
      g << song.genre 
    end
    g.uniq
  end

  def find_by_name(name)
    @@all.detect do |g|
      g.name == name
    end
  end



end

