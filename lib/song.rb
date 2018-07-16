require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if genre != nil
      self.genre=(genre)
    end
    if artist != nil
      self.artist=(artist)
    end

  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
    @@all.uniq

  end

  def self.create(name)
    song = self.new(name)
    self.all << song
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  # binding.pry
  end

  def self.find_by_name (name)
    self.all.detect {|a| a.name == name}

  end

  def self.find_or_create_by_name (name)
    if find_by_name(name) != nil
      find_by_name(name)
    else Song.create(name)
    end
  end

  def self.new_from_filename(songname)
    song2 = songname.chomp(".mp3")
    arr = song2.split(" - ")
    artist = Artist.find_or_create_by_name(arr[0])
    genre = Genre.find_or_create_by_name(arr[2])
    title = arr[1]
    new(title, artist, genre)
  end

  def self.create_from_filename(songname)
    @@all << new_from_filename(songname)
  end



end
