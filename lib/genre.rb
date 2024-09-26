class Genre
extend Concerns::Findable
  attr_accessor :name, :songs
  attr_writer :artists
@@all = []
  def initialize(name)
    @name = name
    @songs = []
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
    genre = self.new(name)
    genre.save
    genre
end

def add_song(song)
  song.genre ||= self
  @songs << song if @songs.include?(song) == false
end


def artists
  artist = self.songs.collect do |song|
    song.artist
end
artist.uniq
end
end