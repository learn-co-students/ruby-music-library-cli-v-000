require 'pry'
class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  #def initialize(name, artist = nil)
 #   @name = name
 #   if artist != nil 
  #    @artist = artist
 #   end
 #   @genre = genre
    #artist.add_song(self)
#binding.pry
  #end
  def self.find_by_name(name)
    @@all.detect {|song| 
      if song.name == name
        song
      end}
  end

  def self.find_or_create_by_name(name)
        Song.create(name) unless Song.find_by_name(name) == nil
      #end
     # binding.pry
  end


  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  #def name=(name)
  #  @name = name
 # end

  #def name
  #  @name
  #end


  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.all
    @@all
  end

  def save
   @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save 
    new_song
  end



end