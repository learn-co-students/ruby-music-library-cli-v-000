class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    unless artist == nil
      self.artist = artist
    end
    unless genre == nil
      self.genre = genre
    end
  end

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
    self.artist
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    unless self.genre.songs.include?(self)
      self.genre.songs << self
    end
    genre
  end

  #Returns array of all song objects
  def self.all
    @@all
  end

  #Clears the all array of all song instances
  def self.destroy_all
    self.all.clear
  end

  #Saves instance of song in the 'all' array
  def save
    self.class.all << self
  end

  #instansiates and saves a new instance of the song class into the 'all' array
  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect do |song|
      name == song.name
    end
  end

  def self.find_or_create_by_name(name)
      if self.find_by_name(name)
        self.find_by_name(name)
      else
        self.create(name)
      end
  end

  def self.new_from_filename(filename)
    clean = filename.split(".mp3")[0]
    art_name = clean.split(" - ")[0]
    song_name = clean.split(" - ")[1]
    genre = clean.split(" - ")[2]
    song = self.find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(art_name)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

end
