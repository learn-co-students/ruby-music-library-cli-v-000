class Song
  attr_accessor :name


  @@all = []

  def initialize (name, artist = "", genre = "")
    @name = name
    if artist != ""
    self.artist=(artist)
  end
    if genre != ""
    self.genre=(genre)
  end
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
    song = Song.new(name)
    song.save
    song
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    if !@genre.songs.include?(self)
      @genre.songs << self
    end
  end

  def self.find_by_name(name)
    self.all.detect {|a| a.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end

  def self.new_from_filename(file_name)
    new_artist = Artist.find_or_create_by_name(file_name.split(" - ")[0])
    new_genre = Genre.find_or_create_by_name(file_name.split(" - ")[2].split(".")[0])
    self.new(file_name.split(" - ")[1], new_artist, new_genre)
    # new(file_name.split(" - ")[0])
    # new(file_name.split(" - ")[2].split(".")[0])
  end

  def self.create_from_filename(file_name)
    new_song = self.new_from_filename(file_name)
    new_song.save
    new_song
  end
end
