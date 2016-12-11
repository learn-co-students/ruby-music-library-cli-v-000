class Song
  attr_accessor :name, :artist, :genre, :filename
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist
      self.artist = artist
    end
    if genre
      self.genre = genre
    end
    @filename = filename
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

  def self.create(name, artist=nil, genre=nil)
    new(name, artist, genre).tap{|s| s.save}

  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) == false
      genre.songs << self
    end
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.all.find {|song| song.name == name}
      self.all.find {|song| song.name == name}
    else self.new(name).tap {|song| song.save}
    end
  end

  def self.new_from_filename(filename)
    file = filename.split(" - ")
    artist_name, song_name, genre_name = file[0], file[1], file[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    file = filename.split(" - ")
    artist_name, song_name, genre_name = file.first, file[1], file[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.create(song_name, artist, genre)
  end
end
