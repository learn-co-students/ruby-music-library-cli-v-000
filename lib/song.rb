class Song

  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(files)
    file_split = files.split(/ - |\./)
    song_artist = file_split[0].strip
    song_title = file_split[1].strip
    song_genre = file_split[2].strip

    artist_object = Artist.find_or_create_by_name(song_artist)
    genre_object = Genre.find_or_create_by_name(song_genre)
    new(song_title, artist_object, genre_object)
  end



  def self.create_from_filename(files)
    song = self.new_from_filename(files)
    song.save
    song
  end

end
