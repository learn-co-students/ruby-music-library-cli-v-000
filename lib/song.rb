class Song

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = [];

  def initialize(name, artist = nil, genre = nil)
    @name = name;
    if artist
      @artist = artist;
    end
    if genre
      @genre = genre
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
    artist.add_song(self);
  end

  def genre
    @genre;
  end

end
