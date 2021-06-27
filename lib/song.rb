require_relative "../concerns/findable.rb"
require_relative 'artist.rb'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all=[]

  def initialize(name, artist=nil, genre=nil)
    @name=name
    self.artist=artist if artist
    self.genre=genre if genre 

  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all<<self
  end

  def self.create(name)
    new_song=self.new(name)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist=artist
    @artist.add_song(self) if !artist.songs.include?(self)
  end

  def genre=(genre)
    @genre=genre
    @genre.songs << self if !genre.songs.include?(self)
  end

  def self.new_from_filename(file)
    name=file.split(" - ")[1]
    artist=Artist.find_or_create_by_name(file.split(" - ")[0]) 
    genre=Genre.find_or_create_by_name(file.split(" - ")[2].gsub(".mp3", ""))
    self.new(name,artist,genre) 
  end

  def self.create_from_filename(file)
    created=self.new_from_filename(file)
    created.save
    created
  end

  def self.print
    self.all.each_with_index {|name, i| puts "'#{i+1}'. '#{name}'"}
  end

end






















