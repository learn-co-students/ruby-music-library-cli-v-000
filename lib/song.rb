class Song

  extend Concerns::Findable

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
      #@artist = artist;
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

  def self.new_from_filename(file)
    parsed_file = file.split(" - ");
    artist_name = parsed_file[0];
    song_name = parsed_file[1];
    genre = parsed_file[2].split(".")[0];

    song = self.new(song_name);#, artist_name, genre
    song.artist = Artist.find_or_create_by_name(artist_name);
    song.genre = Genre.find_or_create_by_name(genre);
    song;
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file);
    song.save;
    song;
  end

end
