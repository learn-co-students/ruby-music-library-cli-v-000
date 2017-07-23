class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if genre.equal?(nil)
      @genre = genre
    elsif genre.instance_of? Genre
      self.genre=(genre)
    else
    g = Genre.create(genre)
    self.genre=(g)
    end

    if artist.equal?(nil)
      @artist = artist
    elsif artist.instance_of? Artist
      self.artist=(artist)
    else
      a = Artist.create(artist)
      self.artist=(a)
    end
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
    song = self.new(name)
    song.save
  end

  #class methods

  def artist=(artist)
    @artist = artist
    if artist.songs.include?(self)
      nil
    else
    artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self)
      nil
    else
    genre.add_song(self)
    end
  end

  def self.find_by_name(name)
    y = []
    x = self.all.detect {|title| title.name == name}
    y << x
  end

  def self.find_or_create_by_name(name)
    x = self.find_by_name(name)
    if x == [nil]
      self.create(name)
    else
      return x
    end
  end

  def self.new_from_filename(file_name)
    x = file_name.split(/\s[-]\s|[.]/)
    y = x[0]
    u = x[1]
    r = x[2]
    z = Song.new(u, y, r)
  end

  def self.create_from_filename(file_name)
    z = self.new_from_filename(file_name)
    z.save

  end


end
