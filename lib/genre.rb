class Genre

  attr_accessor :name, :song
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
    @@all << genre
    genre
  end

  def self.create(genre)
    genre = Genre.new(genre)
    genre.save
    genre
  end

  def add_song(song)
      @songs << song unless @songs.include?(song)
      song.genre = self unless song.genre != nil
      song
    end

     def artists
      artists = @songs.collect do |song|
        song.artist
      end
      artists.uniq
    end

end
