class Song

  attr_accessor :name, :artist, :genre

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
    end
  end

  @@all = []

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    if artist.is_a? String
      artist_instance = Artist.find_or_create_by_name(artist)
      @artist = artist_instance
      artist_instance.add_song(self)
    else
      @artist = artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
    if genre.is_a? String
      genre_instance = Genre.find_or_create_by_name(genre)
      @genre = genre_instance
      if !genre_instance.songs.include?(self)
        genre_instance.songs << self
      end
    else
      @genre = genre
      if !genre.songs.include?(self)
        genre.songs << self
      end
    end
  end

  def self.find_by_name(song_name)
    self.all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create(song_name)
  end

  def self.new_from_filename(filename)
    filename_split = filename.split(" - ")
    self.new(filename_split[1], filename_split[0], filename_split[2].chomp(".mp3"))
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
  end
end
