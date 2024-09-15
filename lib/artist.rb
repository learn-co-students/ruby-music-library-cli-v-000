class Artist
  extend Concerns::Findable
  attr_accessor :name
  @@all = []
   def initialize(name)
    @name = name
    @songs = []
  end
   def songs
    @songs
  end
   def genres
    songs.map {|song| song.genre}.uniq
  end
   def self.all
    @@all
  end
   def save
    @@all << self
  end
   def self.destroy_all
    self.all.clear
  end
   def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end
   def add_song(song)
    songs.include?(song) ? nil : @songs << song
    song.artist ? nil : song.artist = self
  end
 end