require 'pry'

class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    #used to have != nil here, but don't actually need that there
    self.artist = artist if artist #!= nil 
    self.genre = genre if genre #!= nil
    @name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self unless self.class.all.include?(self)
  end

  # def self.create(name)
    # song = self.new(name)
    # song.name = name
    # song.save
    # song
  # end

#this does the same thing as the above code, but is refactored
  def self.create(name, artist = nil, genre = nil)
    new(name, artist, genre).tap{|song| song.save}
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(file)
    info = file.split(" - ")
    artist = Artist.find_or_create_by_name(info[0])
    genre = Genre.find_or_create_by_name(info[2].chomp(".mp3"))
    self.new(info[1], artist, genre)

    #can also do the following:
    #parts = filename.split(" - ")
    #artist_name, song_name, genre_name = parts.first, parts[1], parts[2].gsub(".mp3", "")

    #artist = Artist.find_or_create_by_name(artist_name)
    #genre = Genre.find_or_create_by_name(genre_name)
    #self.new(song_name, artist, genre)
  end

  def self.create_from_filename(file)
    song = Song.new_from_filename(file)
    song.save
    song
  end

  def self.print_songs
    all.each_with_index do|song, index| 
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

end
