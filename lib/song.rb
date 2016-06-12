require "pry"

class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
    self
  end

  def self.create(name, artist = nil, genre = nil)
    Song.new(name, artist, genre).save
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name, artist = nil, genre = nil)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name, artist, genre)
    end
  end

  def self.new_from_filename(filename)
    file_parts = filename.split(" - ")
    artist = Artist.find_or_create_by_name(file_parts[0])
    genre = Genre.find_or_create_by_name(file_parts[2].gsub(/\.mp3/, ""))
    self.new(file_parts[1], artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.list_songs
    song_number = 0
    self.all.each do |song|
      song_number += 1
      puts "#{song_number}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def self.play_song(number)
    song = self.all[number.to_i - 1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end



