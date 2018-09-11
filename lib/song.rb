class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name   = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist_name)
    @artist = artist_name
    artist.add_song(self)
  end

  def genre=(genre_name)
    @genre = genre_name
    genre.songs << self unless genre.songs.include?(self)
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

#Moved to concerns.rb for artist.rb and genre.rb
  def self.create(song_name)
    song = Song.new(song_name)
    song.save
    song
  end

#Moved to concerns.rb for artist.rb and genre.rb
  def self.find_by_name(song_name)
    @@all.find { |song| song.name == song_name}
  end

#Moved to concerns.rb for artist.rb and genre.rb
  def self.find_or_create_by_name(song_name)
    if !find_by_name(song_name)
      create(song_name)
    else
      find_by_name(song_name)
    end
  end

  def self.new_from_filename(filename)
    items = filename.split(" - ")
    artist_name, song_name, genre_name = items[0], items[1], items[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    new(song_name, artist, genre)

  end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap { |file| file.save }
  end



end
