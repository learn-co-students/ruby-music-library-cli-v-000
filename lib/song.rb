class Song
   extend Concerns::Findable
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
 def initialize(name, artist = nil, genre = nil)
   @name = name
   self.artist = artist if artist != nil
   self.genre = genre if genre != nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def genre
    @genre
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
    self.new(name).tap {|song| song.save}
  end
  
  def self.new_from_filename(filename)
     song_file = filename.chomp(".mp3").split(" - ")
     song = self.new(song_file[1])
     song.artist = Artist.find_or_create_by_name(song_file[0])
     song.genre = Genre.find_or_create_by_name(song_file[2])
     song
  end
  
  def self.create_from_filename(filename)
      self.new_from_filename(filename).save
  end
  
  
  
  
  # def self.find_by_name(name)
  #   self.all.find {|songs| songs.name == name}
  # end
  
  # def self.find_or_create_by_name(name)
  #     if self.find_by_name(name)
  #       self.find_by_name(name)
  #     else
  #       self.create(name)
  #     end
  #   end
      
      
    
  
end  