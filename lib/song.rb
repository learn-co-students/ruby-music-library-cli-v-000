class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist
    self.genre = genre
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
    song = Song.new(name)
    song.save
    song
  end
  
  def artist=(artistObject)
    if artistObject != nil
      if !artistObject.songs.include?(self)
        @artist = artistObject        
        @artist.add_song(self)
      end
    end
  end

  def genre=(genreObject)
    if genreObject != nil
      if !genreObject.songs.include?(self)
        @genre = genreObject        
        @genre.songs << self
      end
    end
  end
  
'''  def self.find_by_name(name)
    @@all.detect {|song| song if song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
'''

  def self.new_from_filename(filename)
    songInfo = filename.split(" - ")
    songInfo[2].gsub!(/.mp3/, "")
    artist = Artist.find_or_create_by_name(songInfo[0])
    genre = Genre.find_or_create_by_name(songInfo[2])
    Song.new(songInfo[1], artist, genre)
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end
end