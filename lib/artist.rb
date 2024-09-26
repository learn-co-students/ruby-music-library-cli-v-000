class Artist

extend Concerns::Findable

attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
     if song.artist != self
      @songs << song
      song.artist = self
    end
    if !@songs.include?(song)
      @songs << song
    end
  end

  def self.all
    @@all
  end

   def self.destroy_all
    @@all = @@all.clear
   end

  def save
    self.class.all << self
  end

def self.create(name)
   artist = Artist.new(name)
   artist.save
   artist
  end

  def genres
    self.songs.map {|song| song.genre}.uniq
  end

end