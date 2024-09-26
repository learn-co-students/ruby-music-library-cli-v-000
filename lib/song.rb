require 'pry'
class Song
  
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
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
  
  def self.create(song_name)
    new_song = self.new(song_name)
    new_song.save
    new_song
  end
  
  def artist= (artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre= (genre)
    @genre = genre
    genre.add_song(self)
  end
  
  def self.find_by_name(song_name)
    @@all.find {|song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    if find_by_name(song_name) == nil
      create(song_name)
    else
      find_by_name(song_name)
    end
  end
  
  def self.new_from_filename(filename)
    new_name = filename.chomp('.mp3').split(' - ')[1]
    new_artist = filename.chomp('.mp3').split(' - ')[0]
    new_genre = filename.chomp('.mp3').split(' - ')[2]
    
    artist = Artist.find_or_create_by_name(new_artist)
    genre = Genre.find_or_create_by_name(new_genre)
    new(new_name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end

end