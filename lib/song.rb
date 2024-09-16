class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = new(name)
    song.save
    song

    # Or, as a one-liner:
    # new(name).tap{ |s| s.save }
  end

  def self.find_by_name(name)
    all.detect{ |s| s.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap{ |s| s.save }
  end
end

# class Song
# 	attr_accessor :name
# 	attr_reader :artist, :genre
#
# 	@@all = []
#
# 	def initialize(name, artist=nil, genre=nil)
# 		@name = name
# 		unless artist == nil
# 			@artist = artist
# 			@artist.add_song(self)
# 		end
# 		unless genre == nil
# 			@genre = genre
# 			@genre.add_song(self)
# 		end
# 	end
#
# 	def save
# 		@@all << self
# 	end
#
# 	def self.all
# 		@@all #trying to sort this.  didn't solve the issues
# 	end
#
# 	def self.destroy_all
# 		@@all.clear
# 	end
#
# 	def self.create(name)
# 		s = self.new(name)
# 		s.save
# 		s
# 	end
#
# 	def artist=(artist)
# 		@artist = artist
# 		artist.add_song(self)
# 	end
#
# 	def genre=(genre)
# 		@genre = genre
# 		genre.add_song(self)
# 	end
#
# 	def self.find_by_name(song)
# 		@@all.find {|f| f.name == song}
# 	end
#
# 	def self.find_or_create_by_name(song)
# 		unless (@@all.find {|f| f.name == song})
# 			Song.create(song)
# 		end
# 		@@all.find {|f| f.name == song}
# 	end
#
# 	def self.new_from_filename(filename)
# 		array_name = filename[0..-5].split(/[-]\W/).map {|f| f.strip}
# 		a = Artist.find_or_create_by_name(array_name[0])
# 		g = Genre.find_or_create_by_name(array_name[2])
#
# 		self.new(array_name[1], a, g)
#
# 	end
#
# 	def self.create_from_filename(filename)
# 		array_name = filename[0..-5].split(/[-]\W/).map {|f| f.strip}
# 		a = Artist.find_or_create_by_name(array_name[0])
# 		g = Genre.find_or_create_by_name(array_name[2])
# 		s =  self.new(array_name[1], a, g)
# 		@@all << s
# 		s
# 	end
# end
