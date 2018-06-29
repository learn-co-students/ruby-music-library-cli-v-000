class Song
  attr_reader :artist
  attr_accessor :name, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    self.name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  # FINDABLE

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if song = self.find_by_name(name)
      return song
    else
      return self.create(name)
    end
  end

  # MEMORABLE

  def self.create(name, artist = nil, genre = nil)
    song = self.new(name, artist, genre)
    song.save
    return song
  end

  def self.destroy_all
    self.all.clear
  end

  def self.new_from_filename(filename)
    # which instantiates a
    # new Song object based on a provided filename.

    # musicimporter.import will call this for all
    # files in its db
  end

  def self.create_from_filename
    # which does the same thing as .new_from_filename
    # but also saves the newly-created song to the
    # @@all class variable.
  end
end
