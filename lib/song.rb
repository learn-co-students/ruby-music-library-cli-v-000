class Song

attr_accessor :name
attr_reader :artist, :genre

@@all = []

  def initialize(name, artist = nil, genre = nil)  # Tip: A commonly used default value for optional parameters is nil
    @name= name
    if artist !=nil # meaning, if there is an artist
      self.artist = artist 
      # refer to the custom setter below for .artist
      # the artist of a song instance would be the artist passed in the parameter if there actually is an artist
    end
    
  end
  
  def artist=(artist) #custom setter for artist
    @artist = artist
    artist.add_song(self) #assigns an artist to the song (song belongs to artist)
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

  def self.create(title)
    song = Song.new(title)
    song.save
    song
  end

end