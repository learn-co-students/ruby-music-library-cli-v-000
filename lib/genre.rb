class Genre

  attr_accessor :name, :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  #TODO THIS LINE DOESN'T EXIST IN THE SOLUTION
  def add_song(song)
    self.songs << song unless @songs.include?(song)
    song.genre = self unless song.genre == self
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

  # def to_s
  #   self.name
  # end


end
