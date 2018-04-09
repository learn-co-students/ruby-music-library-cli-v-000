class Song



attr_accessor :name, :artist
attr_reader  :genre

@@all = []

def initialize(name, artist = nil, genre = nil)
  @name = name
  self.artist = artist if artist
  self.genre = genre if genre
  # invokes #genre= instead of simply assigning to a @genre instance variable to ensure that associations are created upon initialization
end

def save
  @@all << self
end

def self.all
  @@all
end

def self.create(name)
  song = new(name)
  song.save
  song
    # initializes and saves the song
end

def self.destroy_all
  @@all.clear
end

def artist=(artist)
  @artist = artist
  artist.add_song(self)
end

def genre=(genre)
  @genre = genre
  genre.songs << self unless genre.songs.include?(self)
      # assigns a genre to the song (song belongs to genre)
      # adds the song to the genre's collection of songs (genre has many songs)
      # does not add the song to the genre's collection of songs if it already exists therein
end

def self.find_by_name(name)
  all.detect{|a| a.name == name}
      # finds a song instance in @@all by the name property of the song
end

def self.find_or_create_by_name(name)
  find_by_name(name) || create(name)
    # returns (does not recreate) an existing song with the provided name if one exists in @@all
    #  invokes .find_by_name instead of re-coding the same functionality
    #  creates a song if an existing match is not found
    #  invokes .create instead of re-coding the same functionality
end

def self.new_from_filename(file)
  song = self.new(file.split(" - ")[1])
  song.artist = file.split(" - ")[0]
  song
end

def self.create_from_filename(file)
  new_from_filename(file).tap{ |song| song.save}
end

end
