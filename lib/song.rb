class Song
  attr_accessor :name

  @@all = []

  def initialize(name, artist = "", genre = "")
    @name = name
    if artist != ""
      self.artist = artist
    end
    if genre != ""
      self.genre = genre
    end
  end

  def name
    @name
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

  def self.create(name)
    song = Song.new(name)
    song.save
    return song
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) == false
      genre.songs << self
    end
  end

  def self.find_by_name(name)
    results = @@all.select { |song| song.name == name}
    results[0]
  end

  def self.find_or_create_by_name(name)
    find_results = self.find_by_name(name)
    if find_results != nil
      return find_results
    else
      new_song = self.create(name)
      return new_song
    end
  end

  def self.new_from_filename(filename)
    song_name = filename.split(" - ")[1]
    artist_name = filename.split(" - ")[0]
    genre = filename.split(" - ")[2].split(".")[0]
    new_song = Song.new(song_name, Artist.find_or_create_by_name(artist_name), Genre.find_or_create_by_name(genre))
  end

  def self.create_from_filename(filename)
    new_song = Song.new_from_filename(filename)
    new_song.save
  end
end
