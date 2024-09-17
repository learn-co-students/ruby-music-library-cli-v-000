class Song

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    self.artist = artist
    self.genre = genre
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

  def self.create(name)
    song = new(name)
    song.save
    song
  end

  def artist=(artist_name)
    @artist = artist_name
    if self.artist != nil
      artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    if self.genre != nil
      if genre.songs.none? {|song| song == self}
        genre.songs << self
      end
    end
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(file)
    song_name = file.split(" - ")[1]
    artist_name = file.split(" - ")[0]
    genre_name = file.split(" - ").last.chomp(".mp3")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    new(song_name, artist, genre)
  end

  def self.create_from_filename(file)
    create_file = new_from_filename(file)
    create_file.save
    create_file
  end
end
