require 'pry'
#require_relative './artist.rb'
#require_relative './music_importer.rb'
#require_relative './genre.rb'
#require_relative './concerns/findable.rb'

class Song
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end
  
  def artist=(artist)
    @artist = artist unless self.artist == artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre unless self.genre == genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  #def self.find_by_name(name)
  #  self.all.detect {|song| song.name == name}
  #end
  #
  #def self.find_or_create_by_name(name)
  #  if self.find_by_name(name).nil?
  #    self.create(name)
  #  else
  #    self.find_by_name(name)
  #  end
  #end
  
  
  def self.new_from_filename(file)
    artist = Artist.find_or_create_by_name(file.split(' - ')[0])
    genre = Genre.find_or_create_by_name(file.split(' - ')[2].split('.')[0])
    song_name = file.split(' - ')[1]
    self.new(song_name, artist, genre)
  end
    
  def self.create_from_filename(file)
    self.new_from_filename(file).save
  end    
    
end

#song = Song.new_from_filename("Tom - Hello.mp3")