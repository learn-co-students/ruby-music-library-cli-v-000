require 'pry'

class Song
  attr_accessor :name, :filename
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name

    if artist != nil && artist.class == Artist #How to refactor ... something like artist ?
      self.artist = artist
    end

    if genre != nil && genre.class == Genre
      self.genre = genre
    end

    @filename = nil

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

  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end

  ################# FINDABLE #################

  def self.find_by_name(name) #ugly plz refactor me
    found_song = nil

    @@all.each do |song|

      if song.name == name
        found_song = song
      end
    end

    found_song

  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create(name)
    else
      self.find_by_name(name)
    end
    # binding.pry
  end

  ################# MP3 IMPORTER #################

  def self.new_from_filename(filename)

    split_file = filename.split(' - ')
    song_name = split_file[1]
    song_artist = split_file[0]
    song_genre = split_file[2].chomp(".mp3")

    song = self.new(song_name, song_artist)
    song.artist = Artist.find_or_create_by_name(song_artist)
    song.genre = Genre.find_or_create_by_name(song_genre)
    song.filename = filename
    song
    # binding.pry
  end

  def self.create_from_filename(filename)

    song = self.new_from_filename(filename)
    song.save
  end

end
