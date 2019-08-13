class Song
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
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.songs << self if @genre.songs.include?(self) == false
  end

  def self.find_by_name(name)
    all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
      end

  def self.new_from_filename(file)
    file_name = file.chomp(".mp3").split(" - ")
    song = file_name[1]

    artist = Artist.find_or_create_by_name(file_name[0])
    genre = Genre.find_or_create_by_name(file_name[2])

    new_song = self.new(song, artist, genre)
  end

  def self.create_from_filename(file)
    new_song = self.new_from_filename(file)
    new_song.save
  end
end
