

class Artist
  extend Concerns::Findable

  @@all = []
  attr_accessor :name, :songs, :genre

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
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
      @songs << song unless @songs.include?(song)
      song.artist = self unless song.artist == self
  end

  def genres
    tmp = []
    self.songs.collect do |song|
      tmp << song.genre
    end
    tmp.uniq
  end

  def self.find_or_create_by_name(name)
    self.find(name) ? self.find(name) : self.create(name)
  end

  def self.find(name)
    self.all.find {|artist| artist.name == name }
  end


  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end

end
