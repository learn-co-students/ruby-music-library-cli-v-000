class Song 
  extend Concerns::Findable
  
attr_accessor :name, :filename
attr_reader :artist, :genre 
@@all = []

  def initialize(name, artist = nil, genre = nil) 
    @name = name
    self.artist=(artist) if artist 
    self.genre=(genre) if genre 

    @filename = filename

  end

  def self.all
    @@all
  end 
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end 
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.destroy_all
   @@all.clear
  end
 
  def save 
    self.class.all << self 
  end
  
  def self.create(name)
    song = self.new(name)
    self.all << song
    song
  end
  
  def self.create_by_name(title) 
    song = self.create(title)  
    song.name = name
    song
  end
  
  def self.find_by_name(title)
    @@all.find{|song| song.name == title}
  end
    
    def self.find_or_create_by_name(title)
        result = self.find_by_name(title)
      if result
        result
     else
        self.create(title)
      end
    end
    
    def self.new_from_filename(filename)

      song = filename.split(" - ")
      artist = Artist.find_or_create_by_name(song[0])
      genre = Genre.find_or_create_by_name(song[2].chomp(".mp3"))
      
      new_song = self.new(song[1], artist, genre)
      
    end 
      
    def self.create_from_filename(filename)
     self.new_from_filename(filename).tap do |song|
     song.save
     
    end

    end
      
   
end
