class Song 

attr_accessor :name, :artist, :genre

@@all = []

def initialize(name, artist=nil, genre=nil)
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

def self.create(name)
  newsong = Song.new(name)
  newsong.save
  newsong
end 

def artist 
  @artist 
end

def genre 
  @genre 
end

def artist=(artist)
  @artist = artist
  if @artist != nil
    @artist.add_song(self)
  end
end

def genre=(genre)
  @genre = genre
  if @genre != nil && @genre.songs.include?(self) == false
    @genre.add_songs(self)
  end
end

def self.find_by_name(findsong)
  @songname = nil
  @@all.each do |song|
    if song.name == findsong
     @songname = song
    end
  end
  @songname
end

def self.find_or_create_by_name(findsong)
    if self.find_by_name(findsong) == nil 
      self.create(findsong)
    else 
      self.find_by_name(findsong) 
  end
end

def self.new_from_filename(name)
  filecleaned = File.basename(name, '.mp3')
  filenamearray = filecleaned.split(' - ')
  artistfromfile = Artist.find_or_create_by_name(filenamearray[0])
  songnamefromfile = filenamearray[1]
  genrefromfile = Genre.find_or_create_by_name(filenamearray[2])
  Song.new(songnamefromfile, artistfromfile, genrefromfile)
end

def self.create_from_filename(name)
  filecleaned = File.basename(name, '.mp3')
  filenamearray = filecleaned.split(' - ')
  artistfromfile = Artist.create(filenamearray[0])
  songnamefromfile = filenamearray[1]
  genrefromfile = Genre.create(filenamearray[2])
  newsong = Song.create(songnamefromfile)
  newsong.genre = genrefromfile
  newsong.artist = artistfromfile
  self.new_from_filename(name)
end


end


