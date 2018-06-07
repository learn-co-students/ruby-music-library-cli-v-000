require 'pry'
class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist)
    self.genre=(genre)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    # binding.pry
    self.class.all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end
  def artist=(artist)
    if artist != nil
      @artist = artist
      artist.add_song(self)
    else
      @artist = artist
    end
  end

  def genre=(genre)
    if genre == nil
      @genre = genre
    else
      @genre = genre
      if !genre.songs.include?(self)
        genre.songs << self
      end
    end
  end

  def self.find_by_name(song)
    all.detect{ |s| s.name == song}
  end

  def self.find_or_create_by_name(song)
    if find_by_name(song)
      find_by_name(song)
    else
      new_song = create(song)
    end
  end

  def self.new_from_filename(file)
    file = file.split(/\.| - /)
    song = Song.new(file[1])
    song.artist = Artist.find_or_create_by_name(file[0])
    song.genre = Genre.find_or_create_by_name(file[2])
    song
  end

  def self.create_from_filename(file)
    song = new_from_filename(file)
    song.save
  end
end
