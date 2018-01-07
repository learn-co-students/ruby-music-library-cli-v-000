class Song
#==================modules=====================
  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::Save
#=================properties===================
  attr_accessor :name, :artist, :genre
  def self.all; @@all end
#=================intialize====================
  def initialize(name, artist = nil, genre = nil)
    self.name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
#==================class=======================
  def self.new_from_filename(file)
		data = file.split(" - ")
    song_name = data[1]
    artist = Artist.find_or_create_by_name(data[0])
		genre = Genre.find_or_create_by_name(data[2].chomp('.mp3'))
		#Instantiate
		song = Song.new(song_name, artist, genre)
	end
	
	def self.create_from_filename(file)
		self.new_from_filename(file).save
	end
#=================instance=====================
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
#==============================================
end


