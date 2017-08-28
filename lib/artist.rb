class Artist
extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs
  @@all=[]

  def initialize(name)
    @name = name
    @songs = []
    # save
  end

def name
  @name
end

def genres
  self.songs.collect{|song| song.genre}.uniq
end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all<<self
  end

  def self.create(artist)
    newartist = Artist.new(artist)
    newartist.save
    newartist
  end

def add_song(song)
  song.artist = self unless song.artist
 self.songs<<song unless songs.include?(song)
end

# USONG MODULE FINDABLE
# def self.find_by_name(name)
#   @@all.detect{|artist| artist.name == name}
# end

end
