class Song
  attr_accessor :name, :genre
  attr_reader :artist
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if genre != nil
      self.genre = genre
    end
    if artist != nil
      self.artist = artist
    end
  end

  def artist= (artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre= (genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
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

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else self.create(name)
    end
  end

  def self.new_from_filename(filename)
    file = filename.chomp(".mp3").split(" - ")
    artist = Artist.find_or_create_by_name(file[0])
    genre = Genre.find_or_create_by_name(file[2])
    Song.new(file[1], artist, genre)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end
end
