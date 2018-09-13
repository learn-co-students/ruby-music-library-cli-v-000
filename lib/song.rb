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
    if genre !=nil
      self.genre = genre
    end
  end

  end

  def artist=(artist) #custom setter for artist
    @artist = artist
    artist.add_song(self) #assigns an artist to the song (song belongs to artist)
  end

  #if the above custom setter method is incorrect, or if artist.add_song(song) in artist.rb is incorrect, this error is triggered:
  #Song #initialize can be invoked with an optional second argument, an Artist object to be assigned to
  #the song's 'artist' property (song belongs to artist)
  # it especially refers to this line in artist.rb: song.artist = self unless (song.artist == nil) == false

  def genre=(genre) #custom setter for genre
    @genre = genre
    genre.add_song(self) #assigns a genre to the song (song belongs to genre)
  end
  #same as the comment above with the above custom setter method and genre.add_song(song) in genre.rb
  #Song #initialize can be invoked with an optional third argument, a Genre object to be assigned to the song's 'genre' property (song belongs to genre)

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
