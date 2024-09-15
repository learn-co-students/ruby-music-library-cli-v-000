require 'pry'

class Song

# each song instance has a song name, associated artist and associated genre 

  @@all =[]

  def initialize(n, a=nil, g=nil)
    
    @name = n
    
    if a != nil 
      self.artist = a
    end

    if g != nil 
      self.genre = g
    end
    
  end

  def artist #reader method
    @artist
  end

  def artist=(a) #writer method

    if !a.songs.include?(self)
      a.add_song(self)
    end
    @artist = a
  end

  def genre
    @genre
  end

  def genre=(g)
    if !g.songs.include?(self)
      g.add_genre(self)
    end
    @genre = g
  end

  def name
    @name
  end

  def name=(n)
    @name = n
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all =[]
    
  end

  def save
    @@all << self
  end

  def self.create(n)
    song = Song.new(n)
    song.save
    song
  end

  # build a class method to find by name

  def self.find_by_name(n)

    @@all.detect do |song|
      if song.name == n
        song
      end   
    end
  end

  #build a class method to find or create by name

  def self.find_or_create_by_name (n)

    a = self.find_by_name(n)
      
    if  a
      return a

    else 
      self.create(n)
    end
  end 

   def self.new_from_filename(file)
    
      a = file.split(" - ").map(&:strip)
      artist = Artist.find_or_create_by_name(a[0])
      genre = Genre.find_or_create_by_name(a[2].gsub(".mp3",""))
      song = Song.new(a[1], artist, genre)
    
     return song
      
   end

   def self.create_from_filename(file)
      song = self.new_from_filename(file)
      song.save
      
    end

end


