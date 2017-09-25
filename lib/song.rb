class Song
 extend Concerns::Findable

 attr_accessor :name, :artist, :genre


 @@all = []

 def initialize(name, artist = nil, genre = nil)
   @name = name
   self.artist = artist
   self.genre = genre
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

 def self.new_by_filename(file_name)
   file_name.split(" - ")[1] = name
   song = self.new(name)
   artist = file_name.split(" - ")[2]
   genre = file_name.split(" - ")[3].chomp(".mp3")
 end

 def self.create_from_filename(file_name)
   self.new(filename)
   self.save
 end

end
