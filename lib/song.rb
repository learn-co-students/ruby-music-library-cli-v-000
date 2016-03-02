require 'pry'

class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    self.artist = artist if artist != nil 
    self.genre = genre if genre != nil
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

  def self.create(name)
    song = self.new(name)
    song.name = name
    song.save
    song
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

  def self.list_artist
    puts "Song?"
    song = gets.strip
    puts song.artist
  end

end
