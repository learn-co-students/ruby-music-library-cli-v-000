class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.songs << self
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !(genre.songs.include?(self))
      genre.songs << self
      genre.add_song(self)
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    new(name).tap {|i| i.save}

    #the following does not work because the return value is an array
    #self.new(name).save
  end

  def self.find_by_name(name)
    self.all.detect {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else self.create(name)
    end
  end

  def self.new_from_filename(filename)
      ids = filename.split(" - ")
      artist_name, song_name, genre_name = ids[0], ids[1], ids[2].gsub(".mp3", "")

      artist = Artist.find_or_create_by_name(artist_name)
      genre = Genre.find_or_create_by_name(genre_name)
      self.new(song_name, artist, genre)
   end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

end
