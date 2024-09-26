class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      @artist = artist
      artist.songs << self
    end
    if genre != nil
      @genre = genre
      if artist.genres.include?(genre) == false
      artist.genres << genre
      end
      if genre.artists.include?(artist) == false
      genre.artists << artist
      end
      genre.songs << self
    end

  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) == false
      genre.songs << self
    end
  end

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
    x = self.new(name)
    x.save
    return x
  end

  def self.new_from_filename(filename)
      array = filename.split(" - ")
      genre_array = array[2].split(".")
      song = self.new(array[1])
      artist = Artist.find_or_create_by_name(array[0])
      song.artist = artist
      genre = Genre.find_or_create_by_name(genre_array[0])
      song.genre = genre
      artist.songs << song
      song
    end

    def self.create_from_filename(filename)
      array = filename.split(" - ")
      genre_array = array[2].split(".")
      song = self.new(array[1])
      artist = Artist.find_or_create_by_name(array[0])
      song.artist = artist
      genre = Genre.find_or_create_by_name(genre_array[0])
      song.genre = genre
      #artist.songs << song
      self.all << song
      song
    end

  def self.find_or_create_by_name(song)
      @@all.each {|x|
        if x.name == song
          return x
        end
      }
      x = self.new(song)
      x.name = song
      @@all << x
      return x
    end

    def self.find_by_name(song)
      @@all.find {|x|
        x.name == song
      }
    end

end