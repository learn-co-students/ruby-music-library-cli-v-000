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
    @songs << song
    song.artist =self unless song.artist.include?(self)
  end
  
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