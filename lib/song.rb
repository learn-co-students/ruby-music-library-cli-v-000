class Song

  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    @genre = genre
    artist.songs << self if artist
    genre.songs << self if genre

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

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(file_name)
    #file_name looks like "Thundercat - For Love I Come - dance.mp3"
    array = file_name.split(" - ") # => ["Thundercat", "For Love I Come", "dance.mp3"]

    song = self.find_or_create_by_name(array[1])
    song.artist = Artist.find_or_create_by_name(array[0])
    song.genre = Genre.find_or_create_by_name(array[2].gsub(".mp3", ""))
    song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end

end

