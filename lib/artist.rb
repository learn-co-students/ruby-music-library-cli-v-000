class Artist
  extend Concerns::Findable

  @@all = []

  attr_accessor :name
  attr_reader   :songs

  def initialize(name, artist=nil, genre=nil)  #take out genre?
    @name  = name
    @songs = []
  end

  def genres
    genres = []
    @songs.each { |song|
      genres << song.genre unless genres.include?(song.genre)
    }
    genres
  end

  def songs=(song)
    add_song(song)
  end

  def add_song(song)
    if song.is_a?(Song)
      @songs << song unless @songs.include?(song)
      song.artist = self unless song.artist == self
    end
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.list_all
    all.each { |artist|
      puts "#{artist.name}"
    }
  end

  def self.list_songs(artist_name)
    artist = find_by_name(artist_name)
    artist.songs.each { |song| song.print }
  end

  def save
    @@all << self
  end
end
