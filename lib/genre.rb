class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all=[]

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.all
    @@all
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
    @@all.detect {|artist| artist.name ==name}
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    created_genre = self.new(name)
  end

  def songs
    @songs
  end

  def add_song(song)
    song.genre = self unless song.genre == self
    @songs << song unless @songs.include?(song)
  end

  def artists
    artists = @songs.collect do |song|
      song.artist
    end
    artists.uniq
  end
end
