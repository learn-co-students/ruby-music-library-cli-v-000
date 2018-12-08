class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  attr_accessor :name
  @@all=[]

  def initialize(name)
    @name=name
    @songs=[]
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all<<self
    self
  end

  def self.create(name)
    genre=self.new(name)
  end

  def self.create(genre)
    genre=Genre.new(genre)
    genre.save
    genre
  end

  def add_song(song)
   song.genre = self unless song.genre == self
   @songs << song unless @songs.include?(song)
  end

  def artists
    @songs.collect {|song| song.artist}.uniq
  end

end
