class Artist

attr_accessor :name

@@all = []

  def initialize(artist_name)
    @name= artist_name
    @songs= []
  end 
  
  def self.all
    @@all
  end 
  
  def self.destroy_all
    self.all.clear
  end 
  
  def save
    self.class.all << self
  end 
  
  def self.create(artist_name)
    artist = Artist.new(artist_name)
    artist.save
    artist
  end 
  
  def songs
    @songs
  end
  
  def add_song(song)
    @songs << song unless @songs.include?(song) # does not add the song to the current artist's collection of songs if it already exists therein
    if song.artist == nil # does not assign the artist if the song already has an artist
    song.artist = self # assigns the current artist (self) to the song's 'artist' property (song belongs to artist)
    end
  end
  
  #  Alternate code below:
  
  #  def add_song(song)
  #    if songs.include?(song) == false
  #    @songs << song
  #    end
  
  #  # only set the artist of the song if it's blank
  #  # note, without this it creates an infinite loop between song.artist= and artist.add_song
  
  #   if song.artist == nil
  #     song.artist = self
  #   end
  #  end

end