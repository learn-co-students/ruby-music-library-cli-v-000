class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
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
    @@all << self
    self
  end

  def self.create(name)
    creation = self.new(name)
    creation.save
    creation
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.find_by_name(name)
    self.all.find{|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    found = self.find_by_name(name)
    if found
      found
    else
      self.create(name)
    end
  end

  def self.new_from_filename(name)
    parsed = name.split(' - ')
    name = parsed[1]
    artist = Artist.find_or_create_by_name(parsed[0])
    genre = Genre.find_or_create_by_name(parsed[2].sub('.mp3', ''))

    song = self.new(name, artist, genre)
    song
  end

  def self.create_from_filename(name)
    self.new_from_filename(name).save
  end
end
