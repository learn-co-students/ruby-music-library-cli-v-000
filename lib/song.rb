class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(the_name, the_artist = nil, the_genre = nil)
    @name = the_name
    self.artist=(the_artist) if the_artist #truthy if it exists
    self.genre=(the_genre) if the_genre #truthy if it exists
  end

  def artist=(the_artist)
    #Song #artist= invokes Artist#add_song to add itself to the artist's
    #collection of songs (artist has many songs)
    @artist = the_artist
    artist.add_song(self)
  end

  def genre=(the_genre) #add song to genre's list of songs unless it's already there
    @genre = the_genre
    the_genre.songs << self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(filename)
    filename_parts = filename.split(' - ')
    artist_name = filename_parts[0]
    song_name = filename_parts[1]
    genre_name = filename_parts[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end
end
