class Artist 

  extend Concerns::Findable 
  attr_accessor :name, :songs, :genres 
  
  @@all = []
  
  def initialize(name)
    @name=name 
    @songs = []
  end 

  
  def save
  @@all << self 
  end 

  def self.all
  @@all
  end 

  def self.destroy_all
  @@all.clear 
  end 

  def self.create(name)
    new_artist = Artist.new(name)
    @@all << new_artist
    new_artist
  end 

    def add_song(song)
    if song.artist == nil 
      song.artist = self 
    else
      nil 
    end 
    if @songs.include?(song)
      nil 
    else 
      @songs << song
    end 
    song 
  end 
  


  def genres
    @new_array = []
    @songs.each do |song|
      if @new_array.include?(song.genre)
        nil
      else
        @new_array << song.genre
      end
    end
    @new_array
  end

end #ends class 
