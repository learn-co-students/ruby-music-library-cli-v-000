class Song

  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil) #("Changes", "Tupac")
    @name = name
    @genre = genre
    if artist != nil
      self.artist=(artist)
    end

    if genre != nil
      self.genre=(genre)
    end
  end

  def self.all #class reader
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all #helper method
    @@all.clear
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end

#Thundercat - For Love I Come - dance.mp3"
  def self.new_from_filename(filename)
    artist = filename.split(" - ")[0]
    name = filename.split(" - ")[1]
    genre = filename.split(" - ")[2].split(".mp3")[0]
    new_song = Song.find_or_create_by_name(name)
    new_song.artist = Artist.find_or_create_by_name(artist)
    new_song.genre = Genre.find_or_create_by_name(genre)
    new_song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end

end
