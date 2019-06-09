require 'pry'

class Artist 
  
   extend Concerns::Findable
  
  @@all = []
    
  attr_accessor :name, :songs
  
  def initialize(name)
    @name = name 
    @songs = []

  end 
  
  def self.all 
    @@all
  end 
  
  def save
    @@all << self 
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
  def self.create(name)
   new_instance= self.new(name)
   new_instance.save 
   new_instance
  end 
  
# ---- passing 002 

def songs
  @songs
end 
  
    def add_song(song)
        if !song.artist 
          song.artist = self 
        end 
        
          if !@songs.include?(song)
         @songs << song  
          end 
      
     end 
      

# ----- 004
  def genres
  genres1 = []
    @songs.each do |song|
        genres1 << song.genre 
    end 
 genres1 = genres1.uniq
 genres1 
  end 
  
  
end 
