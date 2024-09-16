class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all=[]

  def self.all
    @@all
  end

  def initialize(name)
    @name=name
    @songs = []
    save
  end

  def save
    @@all << self
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.size
  end

  def self.find_by_name(name)
    @@all.detect {|artist| artist.name == name}
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    created_artist = self.new(name)
  end

  def songs
    @songs
  end 

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def genres
    genres = @songs.collect do |song|
      song.genre
    end
    genres.uniq
  end
end
