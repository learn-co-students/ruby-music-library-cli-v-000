require_relative "../concerns/findable.rb"

class Genre
 extend Concerns::Findable
 attr_accessor :name
  attr_reader :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs=[]
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
    new_genre = self.new(name)
    new_genre.save
    new_genre
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
   end
  
  def self.list
    @@all.each do |item|
      puts "#{item.name}"
    end
  end
  
  def self.choice_genre(chosen_genre)
    genre_info = @@all.each do |genre| 
      if genre.name == chosen_genre
        genre.songs.each do |song|
         puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end
    end
  end
end