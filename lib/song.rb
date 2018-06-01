



class Song 
	extend Concerns::Findable
	extend Memorable::ClassMethods
	include Memorable::InstanceMethods

  
  attr_accessor :name
  attr_reader :artist, :genre

  
  @@all = [] 
  
  def self.all 
    @@all
  end 
  
  # def self.destroy_all
  #   all.clear
  # end
  
  def initialize(name, artist=nil, genre=nil)
    @name = name 
    @artist=(artist) if artist
    @genre=(genre) if genre 
  end

  
  def save
  	@@all << self
  end
  
  # def self.create(name)
  # 	created_song = Song.new(name)
  # 	created_song.save
  # 	created_song
  # end

  def artist=(artist)
  	self.artist = artist
  	artist.add_song(self) unless artist.songs.include?(self)
  end

   def genre=(genre)
  	self.genre = genre
  	genre.songs << self unless genre.songs.include?(self)
  end

  # def self.find_by_name(name)
  # 	@@all.detect?{|song| song.name == name}
  # end

  # def self.find_or_create_by_name(name)
  # 	if not self.find_by_name
  # 		self.create(name)
  # 	end
  # end

  def self.new_from_filename(filename)
  	art, sng, raw_gnr = filename.split(" - ")
  	gnr = raw_gnr.gsub(".mp3","")
  	artist = Artist.find_or_create_by_name(art)
  	genre = Genre.find_or_create_by_name(gnr)
  	song = self.new(sng, artist, genre)
  end

  def self.create_from_filename(filename)
  	new_from_filename(name).save
  end


  	
end
  



