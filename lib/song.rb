class Song

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.save
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre=(genre)
    end
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    if !(genre.songs.include?(self) )
      genre.songs << self
    end

  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def Song.create(name)
    song = Song.new(name)
    song
  end

  def Song.find_by_name(namec)
    @@all.detect {|song| song.name == namec }
  end

  def Song.find_or_create_by_name(title)
    if Song.find_by_name(title) == nil
      Song.create(title)
    else
      Song.find_by_name(title)
    end
  end

  def Song.new_from_filename(filename)
    title = filename.split(' - ')
    name = title[1]
    x =  Artist.find_or_create_by_name(title[0])
    genree = Genre.find_or_create_by_name(title[2].chomp(".mp3"))
    song = self.new(name, x, genree)
    song
  end

  def Song.create_from_filename(filename)
    self.new_from_filename(filename)
  end

end
