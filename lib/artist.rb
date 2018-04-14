class Artist
  extend Concerns::Findable
  attr_accessor :songs, :name
  @@all = []

def initialize(name)
  self.songs = []
  @name = name
  save
  end

  def self.all
    @@all
  end
  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_artist = self.new(name)
    new_artist.save
    new_artist
    end

    def add_song(song)
      if song.artist != self
        song.artist = self
      end
      if !@songs.include?(song)
          @songs << song
        end
    end


  def genres
    self.songs.collect do |song|
      song.genre
    end.uniq
  end
end
