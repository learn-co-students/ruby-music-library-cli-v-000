class Artist
attr_accessor :name, :songs

extend Concerns::Findable

@@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  # def songs
  #   @songs
  # end

  def self.create(name)
    # new(name).tap{ |a| a.save }
    artist = Artist.new(name)
    artist.save
    artist
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless @songs.include?(song)
  end

  def genres
    genre_array = self.songs.collect do | s |
      # binding.pry
      s.genre
    end
    genre_array.uniq
  end

end
