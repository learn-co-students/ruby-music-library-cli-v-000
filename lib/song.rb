class Song

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    self.name = name
    self.artist = artist
    self.genre = genre
  end

  def save
    self.class.all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) if artist != nil
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) if genre != nil
  end

  # def self.find_by_name(name)
  #   self.all.find { |song| song.name == name }
  # end
  #
  # def self.find_or_create_by_name(name)
  #   self.all.find(self.create(name)) { |song| song.name == name }
  # end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    newInstance = self.new(name)
    newInstance.save
    newInstance
  end

  def self.new_from_filename(filename)
    filename_array = filename.split(" - ")
    newSong = Song.new(filename_array[1])
    newSong.artist = Artist.find_or_create_by_name(filename_array[0])
    newSong.genre = Genre.find_or_create_by_name(filename_array[2].chomp(".mp3"))
    newSong
  end

  def self.create_from_filename(filename)
    newSong = self.new_from_filename(filename)
    newSong.save
    newSong
  end

end

# binding.pry
