require 'pry'

class Song #have one genre
  attr_accessor :name, :artist
  attr_reader :genre

  @@all= []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist= artist if artist != nil
    self.genre= genre if genre != nil
  end

   def artist= (artist)
     @artist = artist
     artist.add_song(self) 
   end

  def genre= (genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)

  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
      self.class.all << self
  end

  def self.create(name)
     song = self.new(name)
     song.save
     song
   end
  
   def self.find_by_name(name)
    all.detect{ |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
  
  def self.new_from_filename(files)
   
    file_parts = files.split(" - ")
    artist_name =file_parts[0]
    song_name =file_parts[1]
    genre_name = file_parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    self.new(song_name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    
    new_from_filename(filename).tap {|f| f.save}
    
  end
  

end
