require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre

  extend Concerns::Findable
  

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist if artist
    artist.songs << self if artist
    @genre = genre if genre
    genre.songs << self if genre
    
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

  def new_from_filename(filename)
    new_name = filename.split(" - ")[1]
    new_song = Song.new(new_name)
    new_song.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])    
    new_song
  end


#----------class methods------------------
  def self.create(name)#, artist = "")
    new_song = Song.new(name)#, artist)
    new_song.save

    return new_song
  end

  def self.find_by_name(name)
    Song.all.each do |song|
      if song.name == name 
          return song
        end
    end
    return false
  end

  def self.create_by_name (name)
    song = Song.new(name)
    song.save
    return song
  end

  def self.find_or_create_by_name(name)
     if self.find_by_name(name)
        self.find_by_name(name)
      else
        self.create_by_name(name)
      end
  end
  


    
end #of class Song


