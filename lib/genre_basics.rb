require 'pry'
class Genre
  attr_accessor :name, :genres
  
  

#----------Genre methods-----------------
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end
  
  def initialize(name)
    @name = name
    @genres = []
  end

  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save
    return new_genre
  end

  def self.destroy_all
    self.all.clear
  end

  # def self.create_by_name (name)
  #   genre = Genre.new(name)
  #   genre.save
  #   return genre
  # end

  # def self.find_by_name(name)
  #   genre.all.each do |genre|
  #     if genre.name == name 
  #         return genre
  #       end
  #   end
  #   return false
  # end

  # def self.find_or_create_by_name(name)
  #    if self.find_by_name(name)
  #       self.find_by_name(name)
  #     else
  #       self.create_by_name(name)
  #     end
  # end

  # def print_songs
  #   songs.each do |song|
  #     puts "#{song.name}"
  #   end
    
  # end
#----------------------------------------

#--------------Song methods--------------
  # @@song_count = 0

  # def add_song(song)
  #   @songs << song
  #   song.genre = self
  #   @@song_count += 1
  # end

  # def songs
  #   @songs
  # end

  # def add_song_by_name(title)
  #   song = Song.new(title)
  #   song.genre = self
  #   @songs << song
  #   @@song_count += 1
  #   #binding.pry
  # end

  # def self.song_count
  #   @@song_count
  # end
#----------------------------------
  
end #of genre class