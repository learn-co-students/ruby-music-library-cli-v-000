class Song

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = [];

  def initialize(name, artist = nil, genre = nil)
    @name = name;
    if artist
      self.artist = artist;
    end
    if genre
      self.genre = genre;
    end
  end

  def self.all
    @@all;
  end

  def self.destroy_all
    @@all.clear;
  end

  def self.create(name)
    song = Song.new(name);
    song.save;
    song;
  end

  def save
    @@all << self;
  end

  def artist
    @artist;
  end

  def artist=(artist)
    @artist = artist;
    self.artist.add_song(self);
  end

  def genre
    @genre;
  end

  def genre=(genre)
    @genre = genre;
    if !genre.songs.include?(self)
      genre.songs << self;
    end
  end

end
