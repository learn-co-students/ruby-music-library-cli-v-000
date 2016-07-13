class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name= name
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
    end
  end

  def artist=(artist)
    raise AssociationTypeMismatchError, "#{artist.class} received, Artist expected." if !artist.is_a?(Artist)
    @artist= artist
    if artist.songs.include?(self) == false
      artist.add_song(self)
    end
  end

  def genre=(genre)
    raise AssociationTypeMismatchError, "#{genre.class} received, Genre expected." if !genre.is_a?(Genre)
    @genre= genre
    if genre.songs.include?(self) == false
      genre.add_song(self)
    end
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.all.detect {|song| song.name == name} == nil
      song = self.new(name)
      song.save
      return song
    else
      self.find_by_name(name)
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def create(name)
    song = Song.new(name)
    song.save
  end

  def self.new_from_filename(filename)
    split_filename = filename.split(" - ")

    song_name = split_filename[1]

    artist_name = split_filename[0]
    artist = Artist.find_or_create_by_name(artist_name)

    genre_name = split_filename[2].slice(/(\w*).mp3/, 1)
    genre = Genre.find_or_create_by_name(genre_name)

    song = self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)

end
