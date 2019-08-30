class Genre
  extend Concerns::Findable
  extend Concerns::Printable

  attr_accessor :name, :songs

  @@all = [] # holds all of the genres created

  # INSTANCE METHODS
  def initialize(name)
    @name = name
    @songs = []
  end

  def save
   Genre.all << self
  end

  def add_song(song)
    self.songs.include?(song) ? return : self.songs << song
    song.genre == nil ? song.genre = self : return
  end

  def artists
    (@songs.collect do |song|
      song.artist
    end).uniq
  end

  # CLASS METHODS
  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    Genre.all.clear
  end
end
