class Song

extend Concerns::Findable

attr_accessor :name
attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.genre=(genre) if genre
    self.artist=(artist) if artist
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_genre(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    instance = self.new(name)
    instance.save
    instance
  end

  def self.new_from_filename(filename)
    file = filename.split(" - ")
    artist_name = file[0].gsub(".mp3", "")
    song_name = file[1].gsub(".mp3", "")
    genre_name = file[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap{|song| song.save}
  end
end
