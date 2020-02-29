class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(song)
    song = self.new(song)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs.push(self) unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    @@all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    elsif !@@all.include?(name)
      create(name)
    end
  end

  def self.new_from_filename(filename)
    artist_name = filename.split(" - ")[0]
    title_name = filename.split(" - ")[1]
    genre_name = filename.split(" - ")[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    song = Song.new(title_name, artist, genre)

  end


  def self.create_from_filename(filename)
    self.new_from_filename(filename).save

  end

end
