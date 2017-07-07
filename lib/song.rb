require_relative '../concerns/findable.rb'
require_relative '../concerns/print.rb'

class Song
  extend Concerns::Findable
  #extend Concerns::Print::ClassMethods

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    artist.add_song(self) if artist
    @genre = genre if genre
    genre.add_song(self) if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.all
    @@all
  end

  def self.print_all
      @@all.each {|song| puts "#{@@all.index(song)+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def save
    @@all << self if !@@all.include?(self)
    @@all.sort!{|a,b| a.artist.name <=> b.artist.name}
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(songname)
    song = self.new(songname)
    song.save
    song
  end

  def self.new_from_filename(filename)
    data = filename.chomp!(".mp3").split(" - ")
    name = data[1]
    artist = Artist.find_or_create_by_name(data[0])
    genre = Genre.find_or_create_by_name(data[2])
    song = self.new(name,artist,genre)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  def self.find_by_index(index)
    play_song = []
    play_song << @@all.fetch(index)
    puts "Playing #{play_song[0]} - #{play_song[1]} - #{play_song[2]}"
  end


end
