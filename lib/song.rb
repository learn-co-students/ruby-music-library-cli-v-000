class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
     self.artist = artist
    end
    if genre != nil
     self.genre = genre
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

  def self.create(name)
    new_object = self.new(name)
    new_object.save
    new_object
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    if !genre.songs.include?(self)
      @genre = genre
      genre.songs << self
    end
  end

  def self.find_by_name(song_name)
    self.all.find do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      Song.create(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.new_from_filename(file)
    file_array = file.split(" - ")
    file_array[2].chomp!(".mp3")
    object = self.find_or_create_by_name(file_array[1])
    object.artist = Artist.find_or_create_by_name(file_array[0])
    object.genre = Genre.find_or_create_by_name(file_array[2])
    object
  end

  def self.create_from_filename(file)
    self.new_from_filename(file)
  end
end
