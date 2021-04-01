class Genre
  extend Concerns::Findable
  
  @@all = []
  attr_accessor :name
  
  def initialize(name)
    @name = name
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
    #new.(name).tap{|a| a.save} #Q&A video refactor
    genre = Genre.new(name)
    genre.save
    genre
  end
  
  def songs 
    Song.all.select{|song| song.genre == self}
  end
  
  def add_song(song)
    #song.genre = self unless song.genre == self #Q&A video refactor
    #songs << song unless @songs.include?(song) #Q&A video refactor
    if song.genre == nil
      song.genre = self
    end
  end
  
  def artists 
    #self.songs.collect{|song| song.genre}.uniq #Q&A video refactor
    genre_artists = []
    Song.all.each do |song|
      if song.genre == self 
        genre_artists << song.artist
      end
    end
    genre_artists.uniq
  end
end



