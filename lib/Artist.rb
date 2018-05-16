class Artist
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def songs
    @songs
  end
  
  def genres
    @genres = []
    @songs.collect do |song|
      if @genres.include?(song.genre) == false
        @genres << song.genre
      end
    end
    @genres
  end
  
  def add_song(song_name)
    if song_name.artist == nil
      song_name.artist = self
    end
    if @songs.include?(song_name) == false
      if song_name.artist == self
        @songs << song_name
      end
    end
  end
        
  def self.find_by_name(artist_name)
    @@all.detect {|i| i.name == artist_name}
  end
  
  
  def self.find_or_create_by_name(artist_name)
    if self.find_by_name(artist_name)
      self.find_by_name(artist_name)
    else
      self.create(artist_name)
    end
  end
  
 def self.create(name)
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def self.all
    @@all
  end
end