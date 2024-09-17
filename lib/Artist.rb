class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def save
    @@all << self
  end

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    self.new(name)
  end

  def add_song(song_instance)
    if song_instance.artist == nil
      song_instance.artist=self
    end
    if @songs.detect{|i| i == song_instance} == nil
      @songs << song_instance
    end
  end

  def genres
    genres = []
    songs = self.songs
      songs.each do |song|
        if genres.detect{|genre| genre == song.genre} == nil
          genres << song.genre
        end
      end
    genres
  end


end
