require 'pry'
class Artist
  attr_accessor :name, :songs
  extend Concerns::Findable
  
  

#----------Artist methods-----------------
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end
  
  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    return new_artist
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create_by_name (name)
    artist = Artist.new(name)
    artist.save
    return artist
  end

  def self.find_by_name(name)
    Artist.all.each do |artist|
      if artist.name == name 
          return artist
        end
    end
    return false
  end

  def self.find_or_create_by_name(name)
     if self.find_by_name(name)
        self.find_by_name(name)
      else
        self.create_by_name(name)
      end
  end

  
#--------------Genre methods-------------   
  def genres
    genre_array = self.songs.collect do |song|
      song.genre
    end
    genre_array.uniq
  end


#--------------Song methods--------------
  # @@song_count = 0

  def add_song(song)
    song.artist == nil ? song.artist = self : nil
    if !self.songs.include?(song) 
      @songs << song
    end
    
  end

  def songs
    @songs
  end

  

  
#----------------------------------
  
end #of Artist class


# def print_songs
  #   songs.each do |song|
  #     puts "#{song.name}"
  #   end
    
  # end

  # def self.song_count
  #   @@song_count
  # end

  # def add_song_by_name(title, artist = "")
  #   song = Song.new(title, artist = "")
  #   song.artist == nil ? song.artist = self : nil 
  #   @songs << song
  #   @@song_count += 1
  
  # end

