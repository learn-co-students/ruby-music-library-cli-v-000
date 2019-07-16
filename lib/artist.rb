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
    @@all.clear
  end 
  
  def save
    @@all << self
  end 
  
  def self.create(name)
    self.new(name).tap do |song|
      song.save
    end
  end 
  
  #add_song
  # assigns the current artist to the song's 'artist' property (song belongs to artist)
  # does not assign the artist if the song already has an artist
  # adds the song to the current artist's 'songs' collection
  # does not add the song to the current artist's collection of songs if it already exists therein
  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end
  
  def genres 
    self.songs.map { |song| song.genre }.uniq
  end 
  
  @artists
end 