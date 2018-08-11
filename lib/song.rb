class Song
  attr_accessor :name
  attr_reader :genre
  @@all = []

  def initialize(name, artist = "", genre = "")
    @name = name
    self.artist = artist if artist != ""
    self.genre = genre if genre != ""
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
    # Song.new(name).save.tap do |song|
    # end
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  # def genre
  #   @genre
  # end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.detect {|s| s == self}
  end

  def self.find_by_name(name)
    self.all.detect{|a| a.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    full_title = filename.split(" - ")
    artist = Artist.find_or_create_by_name(full_title[0])
    genre = Genre.find_or_create_by_name(full_title[2].chomp(".mp3"))
    self.new(full_title[1], artist, genre)
    # song = self.new(full_title[1])
    # song.artist = full_title[0]
    # song.genre = full_title[2].chomp(".mp3")
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

end
