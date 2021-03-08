require 'pry'
class Artist
 attr_accessor :name
 attr_reader :songs

def initialize(name)
  @name = name
  @songs = []
end

 @@all = []

 def self.all
   @@all
 end

 def self.destroy_all
   @@all = []
 end

 def save
   self.class.all << self
 end

 def self.create(name)
   artist = new(name)
   artist.save
   artist
 end

 def add_song(song)
   song.artist = self unless song.artist
   songs.push song  unless songs.include?(song)
 end

 def genres
   songs.map(&:genre).uniq
 end




 #
 #  def initialize(artist_name) #,songs_artist)
 #    @name = artist_name
 #    @songs = []
 #    @song = song
 #    #@songs_artist = songs_artist
 #  end
 #
 #  def self.all
 #   @@all
 #  end
 #
 #  def add_song(song)
 #    self.songs >> @@all
 #  end
 #
 #
 #  def self.destroy_all
 #    self.all.clear
 #  end
 #
 #  def save
 #    self.class.all << self
 #  end
 #
 #  def self.create(artist_name)
 #    artist= Artist.new(artist_name)
 #    artist.save
 #    artist
 #  end
  #
  # def add_song(song)
  #   song.artist = self unless song.artist #Assigned an artist to the song if there was not current artist
  #   songs.push song unless self.song.include?(song)# self.songs.find(song) == true# if the song is already do not add
  #
  #   # song.artist = self unless songs.artist
  #   # songs.push song unless songs.include?(song)
  # end


end
