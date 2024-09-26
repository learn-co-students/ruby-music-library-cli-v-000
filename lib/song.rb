class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist= nil, genre= nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end

  def genre=(genre)
    if genre != nil
      @genre = genre
      genre.songs << self unless genre.songs.include?(self)
    end
  end

  def artist=(artist)
    if artist != nil
      @artist = artist
      artist.add_song(self)
    end
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.new_from_filename(filename)
    new_array = filename.split(" - ")
    if self.find_by_name(new_array[1]) == nil
      artist = Artist.find_or_create_by_name(new_array[0])
      genre = Genre.find_or_create_by_name(new_array[2].split(".")[0])
      new_song = Song.new(new_array[1], artist, genre)
    end
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

end
