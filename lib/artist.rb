class Artist
  @@all = []
  
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end
  
  def create(name)
    new_artist = Artist.new(name)
    self.save
  end
  
  def genres
    @songs.collect do |song_name|
      song_name.genre
    end
  end
  
  def find_by_name(name)
    self.all.find do |artist_name|
      artist_name == name
    end
  end
  
  def add_song(song_title)
    new_song = Song.new(name: song_title, artist: self)
    @songs << new_song
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end

end