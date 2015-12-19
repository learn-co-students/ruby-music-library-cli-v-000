require_relative "../concerns/findable.rb"

class Artist
 extend Concerns::Findable
 attr_accessor :name, :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs =[]
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
  
  def self.create(name)
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end
  
  def songs  
    @songs
  end
  
  def add_song(song)  
    if !self.songs.include?(song) 
      @songs << song
    end
    song.artist = self if song.artist == nil  
  end
  
   def genres
    self.songs.collect {|song| song.genre}.uniq
   end
  
  def self.list
    @@all.each do |item|
      puts "#{item.name}"
    end
  end
  
  def self.choice_artist(chosen_artist)
    artist_info = @@all.each do |artist| 
      if artist.name == chosen_artist
        artist.songs.each do |song|
         puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end
    end
  end

end