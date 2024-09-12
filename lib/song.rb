class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    #@@all << self
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name, artist = nil, genre = nil)
    new(name, artist, genre).tap{|s| s.save}
  end

  def artist=(artist) # involes artist #add_song to add itself to the artist collection of song
    @artist = artist
    artist.add_song(self) # init created upon init adds to songs of artist upon innit
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    self.all.find{|a| a.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end

  def self.new_from_filename(filename)
    #init by passing a file name
    parts = filename.split(" - ") #split
    artist_name, song_name, genre_name = parts.first, parts[1], parts[2].gsub(".mp3", "") # how is the file written out like?

    artist = Artist.find_or_create_by_name(artist_name) # take the info from the split and put it into its a correct locations
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre) #create with our new splittd info
  end

  def self.create_from_filename(filename)

    song = self.new_from_filename(filename)
    song.save
=begin
    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts.first, parts[1], parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.create(song_name, artist, genre)
=end
  end
end
