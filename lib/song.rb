class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist.is_a?(Artist)
    self.genre = genre if genre.is_a?(Genre)
  end
  def self.all
    @@all
  end
  def self.destroy_all
    @@all.clear
  end
  def save
    @@all<<self
  end
  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end
  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end
  def genre=(genre)
    @genre=genre
    genre.songs<<self unless genre.songs.include?(self)
  end
  def self.find_by_name(song_name)
    @@all.find {|song|
      song.name == song_name
    }
  end
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end
  def self.new_from_filename(file)
    song_name = file.split(' - ')[1]
    artist_name = file.split(' - ')[0]
    genre_name = file.split(' - ')[2].chomp(".mp3")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    song = Song.new(song_name, artist, genre)
    song
  end
  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
    song
  end
end
