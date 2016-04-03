class Song
  attr_accessor :name
  attr_reader :genre, :artist
@@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if (artist != nil)
        artist.add_song(self)
        @artist = artist
    end
    if (genre != nil)
        genre.add_song(self)
        @genre = genre
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    artist.add_song(self)
    @artist = artist
  end

  def genre=(genre)
    genre.add_song(self)
    @genre = genre
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if !(self.find_by_name(name))
      self.create(name)
    else self.find_by_name(name)
    end
  end

  def self.new_from_filename(file)
    a = file.chomp("mp3")
    a.split("-")
    song = self.new(a[1], a[0], a[2])
  end
end