class Artist 
  attr_accessor :name, :songs
  extend Concerns::Findable
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    artist = self.new(name)
  end
  
  def save
    @@all << self
  end
  
  def add_song(song)
    if song.artist == nil
      song.artist = self
      self.songs << song
    end
  end
  
  def genres
    genres = []
    @songs.each do |instance|
      test_genre = instance.genre
      if !genres.include?(test_genre)
      genres << test_genre
      end
    end
    genres
  end
end