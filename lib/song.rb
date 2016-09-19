class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    @genre = genre
    if artist != nil
      artist.add_song(self)
    end
    if genre != nil
      genre.songs << self
    end
  end

  def self.create(name, artist = nil, genre = nil)
      song = Song.new(name, artist, genre)
      song.save
      song
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

  def artist=(artist) #set artist. add song to artist if not already included
    @artist = artist
    if !artist.songs.include?(self)
      artist.add_song(self)
    end
  end

  def genre=(genre) #set genre. add song to genre if not already included
    @genre=genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end

  def self.find_by_name(name)
    self.all.each do |song|
      if song.name == name
        return song
      end
    end
  end

  def self.find_or_create_by_name(name)
    self.all.each do |song|
      if song.name == name
        return song
      end
    end
    Song.create(name)
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    genre = data[2].slice(0..(data[2].length-5))
    new_artist = Artist.find_or_create_by_name(data[0])
    new_genre = Genre.find_or_create_by_name(genre)
    self.new(data[1], new_artist, new_genre)
  end

  def self.create_from_filename(filename)
    data = filename.split(" - ")
    genre = data[2].slice(0..(data[2].length-5))
    new_artist = Artist.find_or_create_by_name(data[0])
    new_genre = Genre.find_or_create_by_name(genre)
    self.create(data[1], new_artist, new_genre)
  end
end
