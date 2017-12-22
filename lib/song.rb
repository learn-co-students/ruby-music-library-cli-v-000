class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
    end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
    self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
  end

  def artist
    @artist
  end

  def genre
    @genre
  end

  def self.find_by_name(name)
    return_song = nil
    @@all.each do |song|
      if song.name == name
        return_song = song
      end
    end
    return_song
  end

  def self.find_or_create_by_name(name)
    test_song = Song.find_by_name(name)
    # binding.pry
    if test_song != nil
      test_song
    else
      return_song = Song.create(name)
    end
  end

  def self.new_from_filename(file_name)
    array = file_name.partition(" - ")
    artist_name = array[0]
    song_name = array[2].partition(" - ")[0]
    genre_name = array[2].partition(" - ")[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    new_song = Song.new(song_name, artist, genre)
    new_song
  end

  def self.create_from_filename(file_name)
    song = Song.new_from_filename(file_name)
    song.save
  end


end
