class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre.songs.include?(self)
  end

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist
      @artist = artist
      artist.add_song(self)
    end

    if genre
      @genre = genre
      genre.add_song(self)
    end
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def find_by_name(name)
    song = @@all.select { |song| song.name == name }
    song[0]
  end

  def find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      Song.create(name)
    end
  end
end
