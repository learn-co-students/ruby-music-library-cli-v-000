class Song
  attr_accessor :name, :artist, :genre
  @@all = []
  extend Concerns::Findable

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    @genre = genre
    artist.add_song(self)  if artist != nil
    genre.add_song(self)  if genre != nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !(genre.songs.include?(self))
      genre.add_song(self)
    end
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name, artist=nil, genre=nil)
    song = self.new(name, artist, genre)
    song.save
    song
  end

  def self.new_from_filename(filename)
      items = filename.split(" - ")
      name = items[1]
      artist = Artist.find_or_create_by_name(items[0])
      genre_name = items[2].gsub(".mp3","")
      genre = Genre.find_or_create_by_name(genre_name)
      new_song = self.new(name, artist, genre)
      new_song
    end

    def self.create_from_filename(filename)
      new = self.new_from_filename(filename)
      new.save
      new
    end

end
