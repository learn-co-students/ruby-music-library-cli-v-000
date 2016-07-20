class Genre
  # below we extracting some common functionality of the Findable module into the class
  extend Concerns::Findable # Folder::Filename:  ruby's convention of namespacing modules

  attr_accessor :name, :songs

  @@all =[]

  def initialize(name)
    @name = name
    @@all << self
    @songs = []

  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << Song.new(name)
  end

  # instantiates an instance using .new but also evokes #save on that instance, forcing it to persist immediately.
  def self.create(genre)
    genre = Genre.new(name)
    genre.save
    genre
  end

  # artist has many songs.
  def add_song(song)
    if song.artist!=self
      song.artist = self
    elsif !@songs.include?(song)
      @songs << song
    end
  end

  def artists
    self.songs.collect{|song| song.artist}.uniq
  end

end
