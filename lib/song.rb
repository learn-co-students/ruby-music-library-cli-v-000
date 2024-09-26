class Song

  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name, artist = nil, genre = nil)
    self.new(name, artist, genre).tap do |instance|
      instance.save
    end

    #Long-form code
      #song = self.new(name)
      #song.save
      #song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_from_filename(filename)
    filename_array = filename.split(" - ")
    artist = Artist.find_or_create_by_name(filename_array[0])
    genre = Genre.find_or_create_by_name(filename_array[2].chomp(".mp3"))
    song = self.new(filename_array[1], artist, genre)
  end

  def self.create_from_filename(filename)
    filename_array = filename.split(" - ")
    artist = Artist.find_or_create_by_name(filename_array[0])
    genre = Genre.find_or_create_by_name(filename_array[2].chomp(".mp3"))
    song = self.create(filename_array[1], artist, genre)
  end

end