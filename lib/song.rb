require 'pry'

class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name="def", artist="Defaulty JonJon", genre = "Default Tune")
    @name = name
    @artist = artist
    @genre = genre
    if artist != "Defaulty JonJon"
      artist.songs << self
    end
    if genre != "Default Tune"
      genre.songs << self
    end
  end

  def self.all
    @@all
  end

  def save
    Song.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name, artist="Defaulty JonJon")
    song = self.new(name, artist="Defaulty JonJon")
    song.save
    song
    #binding.pry
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

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
        self.create(name)
      else
        self.find_by_name(name)
    end
  end

  def self.new_from_filename(list)
    #binding.pry
    if list.kind_of?(Array)
      list.each do |file|
        file_a = file.split(" - ")
        song = self.new(file_a[1])
        song.artist = Artist.find_or_create_by_name(file_a[0])
        song.artist.add_song(song.name)
        song
        #binding.pry
      end
    else
      file_a = list.split(" - ")
      #binding.pry
      song = self.new(file_a[1])
      song.artist = Artist.find_or_create_by_name(file_a[0])
      song.genre = Genre.find_or_create_by_name(file_a[2].delete(".mp3"))
      #binding.pry
      song
    end
  end

  def self.create_from_filename(list)
    if list.kind_of?(Array)
      list.each do |file|
        #binding.pry
        file_a = file.split(" - ")
        song = self.create(file_a[1])
        song.artist = Artist.find_or_create_by_name(file_a[0])
        song.genre = Genre.find_or_create_by_name(file_a[2].delete(".mp3"))
        song
      end
    else
      file_a = list.split(" - ")
      song = self.create(file_a[1])
      song.artist = Artist.find_or_create_by_name(file_a[0])
      song.genre = Genre.find_or_create_by_name(file_a[2].delete(".mp3"))
      song
    end
  end


end